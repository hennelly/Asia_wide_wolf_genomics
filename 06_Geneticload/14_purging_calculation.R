######### HIGH CATEGORIES FOR PURGING #########
#### PREPARING DATAFRAMES ####
# read in vcf with 1 header line #
library(tidyverse)
install.packages("stringr")
library (stringr)
library(dplyr)

snpeff_lof <- read.delim("load_LOF_final_final.txt")
snpeff_missense <- read.delim("load_missense_final_final.txt") #missense
snpeff_syn <- read.delim("load_synonymous_variant_final.txt")
snpeff_mod <- read.delim("load_Modifier_final_1_1million_final.txt")
snpeff_mod <- read.delim("load_Modifier_final_1million_2million_header_final.txt")
snpeff_mod <- read.delim("load_Modifier_final_2million_3million_header_final.txt")
snpeff_mod <- read.delim("load_Modifier_final_3million_4million_header_final.txt")
snpeff_mod <- read.delim("load_Modifier_final_4million_5million_header_final.txt")
snpeff_mod <- read.delim("load_Modifier_final_5million_6million_header_final.txt")

###### create variable for impact from info line ######
#lof
snpeff_lof$IMPACT<-ifelse(str_detect(snpeff_lof$INFO,"HIGH"),"HIGH",
	ifelse(str_detect(snpeff_lof$INFO,"MODERATE"),"MODERATE","LOW")) 
#missense
snpeff_missense$IMPACT<-ifelse(str_detect(snpeff_missense$INFO,"HIGH"),"HIGH",
	ifelse(str_detect(snpeff_missense$INFO,"MODERATE"),"MODERATE","LOW")) 
#synonymous
snpeff_syn$IMPACT<-ifelse(str_detect(snpeff_syn$INFO,"HIGH"),"HIGH",
	ifelse(str_detect(snpeff_syn$INFO,"MODERATE"),"MODERATE","LOW")) 
#modifier
snpeff_mod$IMPACT<-ifelse(str_detect(snpeff_mod$INFO,"HIGH"),"HIGH",
	ifelse(str_detect(snpeff_mod$INFO,"MODERATE"),"MODERATE","LOW")) 

####### create variable for ancestral allele from annnotation ########
#lof
snpeff_lof$anc<-str_sub(str_extract(snpeff_lof$INFO,"AA=."),-1)
write.csv(snpeff_lof, "snpeff_lof_ancestralallele.csv") # I then used TRUE and FALSE and made two separate dataframes
#missense
snpeff_missense$anc<-str_sub(str_extract(snpeff_missense$INFO,"AA=."),-1)
write.csv(snpeff_missense, "snpeff_missense_ancestralallele.csv") # I then used TRUE and FALSE and made two separate dataframes
#syn
snpeff_syn$anc<-str_sub(str_extract(snpeff_syn$INFO,"AA=."),-1)
write.csv(snpeff_syn, "snpeff_syn_ancestralallele.csv") # I then used TRUE and FALSE and made two separate dataframes
#mod
snpeff_mod$anc<-str_sub(str_extract(snpeff_mod$INFO,"AA=."),-1)
snpeff_mod$anc_and_ref_same = ifelse(snpeff_mod$anc == snpeff_mod$REF, "TRUE", "FALSE")

snpeff2 <- subset(snpeff_mod, anc_and_ref_same == "TRUE")
snpeff3 <- subset(snpeff_mod, anc_and_ref_same == "FALSE")

## when ancestral allele is same as reference ##
# keep only the columns for each sample, for me this is 27 columns  #
snpeff2<-snpeff2[,10:24]

# keep only the genotype information from each column #
snpeff2<-snpeff2 %>% 
  mutate(across(1:14, ~ substr(.x,1,3)))

# replace genotype information with number of deleterious alleles at each site #
snpeff2<-snpeff2 %>%
  mutate(across(1:14, ~ ifelse(.x %in% c("0/0","0|0"),0,ifelse(.x %in% c("1/0","0/1","1|0","0|1"),1,ifelse(.x %in% c("1|1","1/1"),2,NA))
  )))

# ensure information is stored as numeric #
snpeff2<-snpeff2 %>% mutate(across(1:14, ~ as.numeric(.x)))

## when ancestral allele is not the reference allele ##
# as above #
snpeff3<-snpeff3[,10:24]

# as above #
snpeff3<-snpeff3 %>% 
  mutate(across(1:14, ~ substr(.x,1,3)))

# as above, except homozygous refernence has 2 deleterious alleles not 0 #
snpeff3<-snpeff3 %>%
  mutate(across(1:14, ~ ifelse(.x %in% c("0/0","0|0"),2,ifelse(.x %in% c("1/0","0/1","1|0","0|1"),1,ifelse(.x %in% c("1/1","1|1"),0,NA))
  )))

# rejoin dataframes, add impact information, remove ancestral allelle #
#lof
snpeff4<-rbind(snpeff2,snpeff3)
snpeff4$IMPACT<-snpeff_lof$IMPACT
snpeff4$anc<-NULL
#missense
snpeff4<-rbind(snpeff2,snpeff3)
snpeff4$IMPACT<-snpeff_missense$IMPACT
snpeff4$anc<-NULL
#syn
snpeff4<-rbind(snpeff2,snpeff3)
snpeff4$IMPACT<-snpeff_syn$IMPACT
snpeff4$anc<-NULL
#mod
snpeff4<-rbind(snpeff2,snpeff3)
snpeff4$IMPACT<-snpeff_mod$IMPACT
snpeff4$anc<-NULL

# split into separate dataframes based on impact, remove impact column # 
low<-snpeff4 %>% filter(IMPACT=="LOW")
mod<-snpeff4 %>% filter(IMPACT=="MODERATE")
high<-snpeff4 %>% filter(IMPACT=="HIGH")
low<-low[,-15]
mod<-mod[,-15]
high<-high[,-15]

# remove any site with missing data (NA) #
low<-as.data.frame(t(low))
mod<-as.data.frame(t(mod))
high<-as.data.frame(t(high))
low<-low[,colSums(is.na(low))==0]
mod<-mod[,colSums(is.na(mod))==0]
high<-high[,colSums(is.na(high))==0]

# convert into counts of homozygous neutral (0), heterozygous (1), and homozygous deleterious (2) for each ind/impact #
low2<-t(as.data.frame(apply(low,MARGIN=1,table)))
mod2<-t(as.data.frame(apply(mod,MARGIN=1,table)))
high2<-t(as.data.frame(apply(high,MARGIN=1,table)))

