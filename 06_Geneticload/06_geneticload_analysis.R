library(tidyverse)
install.packages("stringr")
library (stringr)
library(dplyr)

#### PREPARING DATAFRAMES ####
# read in vcf with 1 header line #
snpeff<-read.delim("load_final.txt")

# create variable for impact from info line #
snpeff$IMPACT<-ifelse(str_detect(snpeff$INFO,"HIGH"),"HIGH",
	ifelse(str_detect(snpeff$INFO,"MODERATE"),"MODERATE","LOW"))

# create variable for ancestral allele from annnotation #
snpeff$anc<-str_sub(str_extract(snpeff$INFO,"AA=."),-1)

# separate into 2 dataframes based on whether ancestral and reference allele are the same # did this in excel 
snpeff2<-read.delim("load_refisancestral.txt")
snpeff3<-read.delim("load_altered_refnotancestral.txt")

## when ancestral allele is same as reference ##
# keep only the columns for each sample, for me this is 27 columns  #
#snpeff2<-snpeff2[,10:36]

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
#snpeff3<-snpeff3[,10:36]

# as above #
snpeff3<-snpeff3 %>% 
  mutate(across(1:14, ~ substr(.x,1,3)))

# as above, except homozygous refernence has 2 deleterious alleles not 0 #
snpeff3<-snpeff3 %>%
  mutate(across(1:14, ~ ifelse(.x %in% c("0/0","0|0"),2,ifelse(.x %in% c("1/0","0/1","1|0","0|1"),1,ifelse(.x %in% c("1/1","1|1"),0,NA))
  )))

# rejoin dataframes, add impact information, remove ancestral allelle #
snpeff4<-rbind(snpeff2,snpeff3)
snpeff4$IMPACT<-snpeff$IMPACT
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
low2<-t(as.data.framlow2e(apply(low,MARGIN=1,table)))
mod2<-t(as.data.frame(apply(mod,MARGIN=1,table)))
high2<-t(as.data.frame(apply(high,MARGIN=1,table)))
