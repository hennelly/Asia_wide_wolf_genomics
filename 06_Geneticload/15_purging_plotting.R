dat <- read.csv("Geneticload_missense_LOF_final.csv", header=TRUE)
ggplot(data=dat, aes(x=Total.genetic.load, y=hom_derivedLOF, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=hom_derivedLOF, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=hetLOF, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=Total.genetic.load, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 

dat <- read.csv("Geneticload_missense_final.csv", header=TRUE)
ggplot(data=dat, aes(x=total_derived_alleles_missense, y=HOM_derived_missense, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=HOM_derived_missense, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=HET_missense, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=total_derived_alleles_missense, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 

dat <- read.csv("Geneticload_syn_final.csv", header=TRUE)
ggplot(data=dat, aes(x=total_derived_count_syn, y=HOM_syn, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=HOM_syn, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=HET_syn, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=total_derived_count_syn, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 

dat <- read.csv("Geneticload_syn_final.csv", header=TRUE)
ggplot(data=dat, aes(x=total_derived_count_syn, y=HOM_syn, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=HOM_syn, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=HET_syn, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=total_derived_count_syn, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 

dat <- read.csv("Geneticload_modifier_final.csv", header=TRUE)
ggplot(data=dat, aes(x=derivedcount_modifer, y=HOM_modifier, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c("black", '#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=HOM_modifier, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c("black",'#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=HET_modifer, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c("black", '#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
ggplot(data=dat, aes(x=Heterozygosity, y=derivedcount_modifer, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c("black",  '#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 


#COMBINED PLOTS


It looks like Indian and Tibetan wolves have less overall derived alleles, likely due to genetic drift and loss of alleles due to inbreeding
All other categories except LOF show that Tibetan/Mexican/Indian wolves have more HOM alleles, however, less derived alleles (total genetic load) suggesting purging. 
In LOF only one Mexican wolf and one Indian wolf show lower genetic load (overall deleterious alleles) than outbred populations. 

Lower genetic load overall due to genetic drift and loosing alleles to fixation of reference allele. Also lower heterozygosity overall
due to genetic drift in small population and fixation (quail paper, both genic and genome-wide shows loss of alleles, and high realized load).

I dont know what the LOF pattern is different than the other ones. Maybe only a few (100s) compared to other cateogries? 

#LOF
dat <- read.csv("Geneticload_LOF_longform_final.csv", header=TRUE)
dat2 <- dat[!(dat$category %in% "hetLOF"),]
dat2 <- dat[dat$category == c("hom_derivedLOF", "totalgeneticload"),]

p <- ggplot(data=dat, aes(x=Heterozygosity, y=count, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c('#A0CBE8','#499894', "#B07AA1", "black", "#FF9D9A", "orange")) 
p +   facet_grid(category ~ . , scales = "free") + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 
ggsave("May2_geneticload_LOF.pdf", width=5,height=5)

#missense
dat <- read.csv("Geneticload_missense_longform_final.csv", header=TRUE)
p <- ggplot(data=dat, aes(x=Heterozygosity, y=count, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c("black", '#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
p +   facet_grid(category ~ . , scales = "free") + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 
ggsave("May2_geneticload_missense.pdf", width=5,height=5)

#syn
dat <- read.csv("Geneticload_syn_longform_final.csv", header=TRUE)
p <- ggplot(data=dat, aes(x=Heterozygosity, y=count, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c("black", '#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
p +   facet_grid(category ~ . , scales = "free") + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 
ggsave("May2_geneticload_syn.pdf", width=5,height=5)

#modifier
dat <- read.csv("Geneticload_modifier_longform_final.csv", header=TRUE)
p <- ggplot(data=dat, aes(x=Heterozygosity, y=count, color=Group)) + geom_point() + theme_classic() + scale_color_manual(values=c("black", '#499894','#A0CBE8', "#FF9D9A", "#B07AA1", "orange")) 
p +   facet_grid(category ~ . , scales = "free") + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 
ggsave("May2_geneticload_mod.pdf", width=5,height=5)

#compare to total derived alleles of modifiers (per 100,000 sites)


#mutational load impact
 dat <- read.csv("comparedto_totalderivedalleles_final.csv", header=TRUE)
e <- ggplot(dat, aes(x = Group, y = MODF_mutationaload_per100000))   
e + labs(y="Mutation load per 100,000 derived neutral alleles") + geom_boxplot(aes(color=Group), alpha = 0.1) + theme_classic() + geom_jitter(
  aes(color = Group, size=2), 
  position = position_jitterdodge(jitter.width = 0.5, dodge.width = 0.5),
  size = 1.2
  ) + scale_color_manual(values = c(Casia = "mediumseagreen",
                                SWAsia = "yellowgreen",
                                B_Indian = "maroon4", 
                                A_Mexican= "darkgreen", 
                                CAA_Tibetan = "orange2")) + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 
ggsave("Sept9_geneticload_mutationsload.pdf", width=3.4,height=3.8)

#MODERATE IMPACT
e <- ggplot(dat, aes(x = Group, y = MODF_moderateimpact_per_100000))   
e + labs(y="Missense per 100,000 derived neutral alleles") + geom_boxplot(aes(color=Group), alpha = 0.1) + theme_classic() + geom_jitter(
  aes(color = Group, size=2), 
  position = position_jitterdodge(jitter.width = 0.5, dodge.width = 0.5),
  size = 1.2
  ) + scale_color_manual(values = c(Casia = "mediumseagreen",
                                SWAsia = "yellowgreen",
                                B_Indian = "maroon4", 
                                A_Mexican= "darkgreen", 
                                CAA_Tibetan = "orange2")) + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 
ggsave("Sept9_geneticload_missense_FINAL.pdf", width=3.7,height=3.5)

#HIGH IMPACT 
e <- ggplot(dat, aes(x = Group, y = MODF_highimpact_per_10000))   
e + labs(y="LOF per 100,000 derived neutral alleles") + geom_boxplot(aes(color=Group), alpha = 0.1) + theme_classic() + geom_jitter(
  aes(color = Group, size=2), 
  position = position_jitterdodge(jitter.width = 0.5, dodge.width = 0.5),
  size = 1.2
  ) + scale_color_manual(values = c(Casia = "mediumseagreen",
                                SWAsia = "yellowgreen",
                                B_Indian = "maroon4", 
                                A_Mexican= "darkgreen", 
                                CAA_Tibetan = "orange2")) + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 
ggsave("Sept9_geneticload_LOF_FINAL.pdf", width=3.7,height=3.8)

#SYN
e <- ggplot(dat, aes(x = Group, y = MODF_syn_per_100000))   
e + labs(y="Synonymous per 100,000 derived neutral alleles") + geom_boxplot(aes(color=Group), alpha = 0.1) + theme_classic() + geom_jitter(
  aes(color = Group, size=2), 
  position = position_jitterdodge(jitter.width = 0.5, dodge.width = 0.5),
  size = 1.2
  ) + scale_color_manual(values = c(Casia = "mediumseagreen",
                                SWAsia = "yellowgreen",
                                B_Indian = "maroon4", 
                                A_Mexican= "darkgreen", 
                                CAA_Tibetan = "orange2")) + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 
ggsave("Sept9_geneticload_Synonymous_FINAL.pdf", width=3.7,height=3.8)

#Total derived count 
e <- ggplot(dat, aes(x = Group, y = Total.derived.count))   
e + labs(y="Total derived count") + geom_boxplot(aes(color=Group), alpha = 0.1) + theme_classic() + geom_jitter(
  aes(color = Group, size=2), 
  position = position_jitterdodge(jitter.width = 0.5, dodge.width = 0.5),
  size = 1.2
  ) + scale_color_manual(values = c(Casia = "mediumseagreen",
                                SWAsia = "yellowgreen",
                                B_Indian = "maroon4", 
                                A_Mexican= "darkgreen", 
                                CAA_Tibetan = "orange2")) + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 
ggsave("Sept9_totalderivedcount_FINAL.pdf", width=3.7,height=3.8)

## 


## COMPARE FOR PURGING 
 dat <- read.csv("Sept6_purging_final.csv", header=TRUE)
 # Change box plot colors by groups

p<-ggplot(dat, aes(x=Group, y=relativederivedcountper100000, color=category2)) +
  geom_boxplot(position=position_dodge(1))
q <- p + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) +  facet_wrap(~Heterozygosity, scales = "free") 

q +scale_color_manual(values=c("#56B4E9", "#E69F00", "black"))

ggsave("Sept9_geneticload_comparepurgingt.pdf", width=11,height=3)
```
