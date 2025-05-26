library(tidyverse)
install.packages("stringr")
library (stringr)
library(dplyr)

#### PREPARING DATAFRAMES ####
# read in vcf with 1 header line #
snpeff<-read.delim("load_final_final.txt")

# create variable for impact from info line #
snpeff$IMPACT<-ifelse(str_detect(snpeff$INFO,"HIGH"),"HIGH",
	ifelse(str_detect(snpeff$INFO,"MODERATE"),"MODERATE","LOW"))

# create variable for ancestral allele from annnotation #
snpeff$anc<-str_sub(str_extract(snpeff$INFO,"AA=."),-1)

# separate into 2 dataframes based on whether ancestral and reference allele are the same # did this in excel 
snpeff2<-read.delim("load_refisancestral_final.txt")
snpeff3<-read.delim("load_altered_refnotancestral_final.txt")

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

## load results

dat <- read.csv("geneticload_wolves_final_final.csv", header=TRUE)

dat <- read.csv("Geneticload_missense_longform_final.csv", header=TRUE)
p <- ggplot(data=dat, aes(x=Heterozygosity, y=count, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c("black", '#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
p +   facet_grid(category ~ . , scales = "free") + 
  theme(axis.text.x = element_text(color="black", size = 15), axis.text.y = element_text(color="black", size = 15), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 


dat_high <- subset(dat, Impact == "HIGH") #get rid of ROH below 100kb
data_long_high <- gather(dat, catergory, amount, homozgyous_nuetral:homozygous_deleterious, factor_key=TRUE)

# Change the colors manually
p <- ggplot(data=data_long_high, aes(x=sample, y=geneticload, fill=catergory)) +
geom_bar(stat="identity", color="black", position=position_dodge())+
  theme_classic()
# Use custom colors
p + scale_fill_manual(values=c('#999999','#E69F00', "blue")) +   facet_grid(IMPACT ~ . , scales = "free")

ggplot(data_long_high, aes(x=Group, y=amount, fill=catergory)) +
+   geom_boxplot()  +   facet_grid(Impact ~ . , scales = "free")

ggsave("Apr10_geneticload.tiff", width=6,height=6)

###################################################
###################################################
## genetic load by heterozygous and homozgyous ####
###################################################
###################################################
dat <- read.csv("geneticload_wolves_HETvsHOM_final.csv", header=TRUE)
e <- ggplot(dat, aes(x = Group, y = Number, fill=HETorHOM))  

p <- e + labs(y="Allelic count") + geom_boxplot(aes(color=Group, fill=HETorHOM), alpha = 0.1) + theme_classic() + 
  geom_boxplot(position=position_dodge(1)) + geom_jitter(
  aes(color = Group, size=2), 
  position = position_jitterdodge(jitter.width = 0.5, dodge.width = 0.5),
  size = 1.2
  ) + scale_color_manual(values = c(D_CentralAsia = "mediumseagreen",
                                B_SWAsia = "yellowgreen",
                                A_Indian = "maroon4", 
                                Mexican= "darkgreen", 
                                C_Tibetan = "orange2")) + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) +   
  facet_wrap(Impact ~ HETorHOM, scales = "free")

p
ggsave("Sept9_geneticload.pdf", width=8,height=2)


# Change box plot colors by groups
ggplot(dat, aes(x=Group, y=Number, color=HETorHOM)) +
  geom_boxplot()
# Change the position

p<-ggplot(dat, aes(x=Group, y=Number, color=HETorHOM)) +
  geom_boxplot(position=position_dodge(1))
q <- p + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) +  facet_wrap(~Impact, scales = "free") 

q +scale_color_manual(values=c("#56B4E9", "#E69F00"))
ggsave("Sept9_geneticload_HomvsHet_FINAL.pdf", width=11,height=3)

#############################
#############################
#### PLOT EACH CATEGORY #####
#############################
#############################
dat <- read.csv("Sept6_geneticload_eachcategory_final.csv", header=TRUE)

e <- ggplot(dat, aes(x = Group, y = Total.genetic.load, color=Group))  

p <- e + labs(y="Allelic count") + geom_boxplot(aes(color=Group), alpha = 0.1) + theme_classic() + 
  geom_boxplot(position=position_dodge(1)) + geom_jitter(
  aes(color = Group, size=2), 
  position = position_jitterdodge(jitter.width = 0.5, dodge.width = 0.5),
  size = 1.2
  ) + scale_color_manual(values = c(D_CentralAsia = "mediumseagreen",
                                E_SW_Asia = "yellowgreen",
                                B_Indian = "maroon4", 
                                AMexican= "darkgreen", 
                                C_Tibetan = "orange2")) + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) +   
  facet_wrap(highmedlow ~ category, scales = "free")
p
ggsave("Sept9_geneticload_highmedlow.pdf", width=11,height=9)
