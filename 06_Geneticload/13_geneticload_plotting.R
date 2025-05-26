### Total Genetic load - boxplots

dat <- read.csv("July29geneticload_wolves_totalmasked_longform_final.csv", header=TRUE)

e <- ggplot(dat, aes(x = Population, y = Allelic.count))   
e + labs(y="Allelic count") + geom_boxplot(aes(color=Population), alpha = 0.1) + theme_classic() + geom_jitter(
  aes(color = Population, size=2), 
  position = position_jitterdodge(jitter.width = 0.5, dodge.width = 0.5),
  size = 1.2
  ) + scale_color_manual(values = c(ECentralAsia = "mediumseagreen",
                                SWAsia = "yellowgreen",
                                BIndian = "maroon4", 
                                AMexican= "darkgreen", 
                                DTibetan = "orange2")) + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) +   
  facet_wrap(~ category, scales = "free")
ggsave("Sept9_geneticload_overall_FINAL.pdf", width=8,height=2)

##################################
##################################
#### DERIVE VS TOTAL ALLELES #####
##################################
##################################
 dat <- read.csv("comparedto_totalderivedalleles_final.csv", header=TRUE)
e <- ggplot(dat, aes(x = Population, y = ATotal.load ))   
e + labs(y="ATotal.load") + geom_boxplot(aes(color=Population), alpha = 0.1) + theme_classic() + geom_jitter(
  aes(color = Population, size=2), 
  position = position_jitterdodge(jitter.width = 0.5, dodge.width = 0.5),
  size = 1.2
  ) + scale_color_manual(values = c(ECentralAsia = "mediumseagreen",
                                SWAsia = "yellowgreen",
                                BIndian = "maroon4", 
                                AMexican= "darkgreen", 
                                DTibetan = "orange2")) + 
  theme(axis.text.x = element_text(color="black"), axis.text.y = element_text(color="black"), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 
ggsave("May31_poster_ATotal.load.png", width=3,height=3)
