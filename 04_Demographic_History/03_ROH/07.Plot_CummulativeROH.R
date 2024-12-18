#########################################
##### Cummulative ROH vs. ROH length #### 
#########################################
#R
dat <- read.csv("June62022_final_ROHbcftools_cummulativeROH.csv", header=TRUE)

#Filter out ROH
dat <- subset(dat, Length.bp. > 100000)
dat <- subset(dat, Quality > 80)

#Plotting
p <- ggplot(dat, aes(x=Length.bp., y=Cummulative, color=Sample)) + theme_classic() + scale_x_log10()   +
  geom_line(size=1.2, alpha=0.75) + scale_color_manual(values=c("orangered2", "lightsalmon", "royalblue", "royalblue", "royalblue", "orangered2", "royalblue", "lightsalmon", "burlywood3", "burlywood3", "orange", "mediumseagreen", "lightsalmon", "lightsalmon", "mediumseagreen", "orange", "royalblue", "royalblue", "orange", "black" ))
p
q <- p + geom_line(aes(size = Bold))  +
  scale_size_manual(values = c(0.1, 1.5))  
q 

ggsave("June62022Cummulative_ROH.tiff", width=7, height=7)
