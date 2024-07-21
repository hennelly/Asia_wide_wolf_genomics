#Plot in R

#install.packages("ggbeeswarm")
library(ggbeeswarm)

#Read dataset
dat <- read.csv("July18_Dstatistics_Tibetanwolf_withlocation.csv", header=TRUE)

#plot file
p <- ggplot(dat, aes(Group_ordered, Dstat, color=Group_ordered))  
q <- p + geom_violin(width = 1.3) + geom_quasirandom(alpha = 1, width = 0.2) + theme_classic() 
r <- q +  geom_hline(yintercept=0, linetype='dotted', col = 'black') 
s <- r + scale_color_manual(values = c(A_highPakistan = "yellowgreen", B_Tajikistan= "yellowgreen", C_Kyrgyzstan = "yellowgreen",D_Xinjiang = "yellowgreen", E_EastChina= "darkseagreen4", F_Mongolia= "darkseagreen4", G_Kazakhstan="yellowgreen", H_Russia="yellowgreen", I_Europe="green2", Z_SouthwestAsia="lightseagreen"))
s +
  theme(axis.text.x = element_text(color="black", size = 2), axis.text.y = element_text(color="black", size = 15), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 

ggsave("July20_Dstatistic_Tibetanwolf.tiff", width=8,height=3)
