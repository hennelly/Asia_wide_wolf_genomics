library (ggplot2)
library(tidyverse)
library(dplyr)

############################################
### Plotting bar graph of ROH categories ###
############################################
dat <- read.csv ("Allsamples_autosomes_RG_100kb_final.csv", header=TRUE)

#put in order
dat_order <- dat %>%
  group_by(Sample, Length.bp.) %>%
  mutate(across(everything(), sort)) %>%
  arrange(Sample,Length.bp.)

dat <- read.csv ("Allsamples_autosomes_RG_100kb_cummulative_final.csv", header=TRUE)

# Get ROH values between 0.1-1Mb
dat_0.1_1Mb <- subset(dat, Length.bp. < 1000000)
aggregate(dat_0.1_1Mb$Length.bp., by=list(Category=dat_0.1_1Mb$Sample), FUN=sum)

# Get ROH values between 1-5Mb
dat_1_10Mbtest <- subset(dat, Length.bp. > 1000000)
dat_1_10Mb <- subset(dat_1_10Mbtest, Length.bp. < 5000000)
aggregate(dat_1_10Mb$Length.bp., by=list(Category=dat_1_10Mb$Sample), FUN=sum)

# Get ROH values between 5-10Mb
dat_10_100Mb <- subset(dat, Length.bp. > 5000000)
dat_10_100Mbfinal <- subset(dat_10_100Mb, Length.bp. < 10000000)
aggregate(dat_10_100Mbfinal$Length.bp., by=list(Category=dat_10_100Mbfinal$Sample), FUN=sum)

# Get ROH values between 10-100Mb
dat_10_100Mb <- subset(dat, Length.bp. > 10000000)
dat_10_100Mbfinal <- subset(dat_10_100Mb, Length.bp. < 100000000)
aggregate(dat_10_100Mbfinal$Length.bp., by=list(Category=dat_10_100Mbfinal$Sample), FUN=sum)

#Plotting by category
dat <-read.csv("Jan10_FINAL_ROHlengthdistribution_final.csv", header=TRUE)
data_long <- gather(dat, ROHcat, Length, between0.1.1Mb:between10.100Mb, factor_key=TRUE)
write.csv (data_long, "Jan10_FINAL_ROHlengthdistribution_order_final.csv")

###############################
### PLOT FINAL DISTRIBUTION ###
###############################
dat <-read.csv("Jan10_2FINAL_ROHlengthdistribution_order_final.csv", header=TRUE)

#Revision 
dat <-read.csv("REVISION_May1_2025_FINAL_ROHlengthdistribution_order_final.csv", header=TRUE)

p <- ggplot(dat, aes(fill=ROHcat, y=Length, x=reorder(Sample,-Totalsize ))) + 
    geom_bar(position="stack", stat="identity", color="black") + theme_classic() + coord_flip() + scale_fill_manual(values = c("yellow", "#e6ab02", "#d95f02" ,"#7570b3")) + scale_x_discrete(labels=c("5.0e+08" = "0.5", "1.0e+09" = "1","1.5e+09" = "1.5"))+  theme(axis.text.x = element_text(color="black", size = 10), axis.text.y = element_text(color="black", size = 10))
p
ggsave("REVISION_May1_2025_ROHlengths.tiff", width=7,height=6)


#######################################
###### Estimating inbreeding times ####
#######################################
# Get ROH values below 0.16Mb- inbreeding before 1000 years ago
dat1000 <- subset(dat, Length.bp. < 160000)
finaldat1000 <- aggregate(dat1000$Length.bp., by=list(Category=dat1000$Sample), FUN=sum)
#Plot
p <- ggplot(finaldat1000, aes(y=x, x=reorder(Category,-x ))) + 
    geom_bar(position="stack", stat="identity", color="black") + theme_classic() + coord_flip() + scale_fill_manual(values = c("yellow", "#e6ab02", "#d95f02" ,"#7570b3")) + scale_x_discrete(labels=c("5.0e+08" = "0.5", "1.0e+09" = "1","1.5e+09" = "1.5"))+  theme(axis.text.x = element_text(color="black", size = 10), axis.text.y = element_text(color="black", size = 10))
p
ggsave("Jan15_ROHlength_ancientinbreeding.tiff", width=5,height=6)

# Get ROH values between 0.2-0.5Mb- inbreeding between 820-328 years ago
data820 <- subset(dat, Length.bp. > 200000)
data820 <- subset(data820, Length.bp. < 500000)
finaldat820 <- aggregate(data820$Length.bp., by=list(Category=data820$Sample), FUN=sum)
#Plot
p <- ggplot(finaldat820, aes(y=x, x=reorder(Category,-x ))) + 
    geom_bar(position="stack", stat="identity", color="black", fill="#7570b3") + theme_classic() + coord_flip() 
p
ggsave("Jan15_ROHlength_820to328years.tiff", width=5,height=6)

# Get ROH values between 0.5-1.6Mb inbreeding between 328-100 years ago
dat328 <- subset(dat, Length.bp. > 500000)
dat328 <- subset(dat328, Length.bp. < 1600000)
finaldat328 <- aggregate(dat328$Length.bp., by=list(Category=dat328$Sample), FUN=sum)
#Plot
p <- ggplot(finaldat328, aes(y=x, x=reorder(Category,-x ))) + 
    geom_bar(position="stack", stat="identity", color="black", fill="#d95f02") + theme_classic() + coord_flip() 
p
ggsave("Jan15_ROHlength_328-100years.tiff", width=5,height=6)

# Get ROH between 100 and 50 years ago to present
dat50 <- subset(dat, Length.bp. > 1600000)
dat100to50 <- subset(dat50, Length.bp. < 3000000)
finaldat100to50 <- aggregate(dat100to50$Length.bp., by=list(Category=dat100to50$Sample), FUN=sum)
#Plot
p <- ggplot(finaldat100to50, aes(y=x, x=reorder(Category,-x ))) + 
    geom_bar(position="stack", stat="identity", color="black", fill="#e6ab02") + theme_classic() + coord_flip() 
p
ggsave("Jan15_ROHlength_100to50years.tiff", width=5,height=6)

# Get ROH between 50 years ago to present
datpresent <- subset(dat, Length.bp. > 3000000)
finaldatpresent <- aggregate(datpresent$Length.bp., by=list(Category=datpresent$Sample), FUN=sum)
#Plot
p <- ggplot(finaldatpresent, aes(y=x, x=reorder(Category,-x ))) + 
    geom_bar(position="stack", stat="identity", color="black", fill="yellow") + theme_classic() + coord_flip()
p
ggsave("Jan15_ROHlength_50yearsagotopresent.tiff", width=5,height=6)


# Get ROH between 50 years ago to present
dat_0.5_1Mb <- subset(dat, Length.bp. > 16000000)
dat_0.5_1Mb <- subset(dat, Length.bp. > 16000000)

finaldat <- aggregate(dat_0.5_1Mbfinal$Length.bp., by=list(Category=dat_0.5_1Mbfinal$Sample), FUN=sum)
#Plot
p <- ggplot(finaldat, aes(y=x, x=reorder(Category,-x ))) + 
    geom_bar(position="stack", stat="identity", color="black") + theme_classic() + coord_flip() + scale_fill_manual(values = c("yellow", "#e6ab02", "#d95f02" ,"#7570b3")) + scale_x_discrete(labels=c("5.0e+08" = "0.5", "1.0e+09" = "1","1.5e+09" = "1.5"))+  theme(axis.text.x = element_text(color="black", size = 10), axis.text.y = element_text(color="black", size = 10))
p
ggsave("Jan15_ROHlength_ancientinbreeding.tiff", width=7,height=6)

##############################
## Making the FROH vs. SROH ## 
##############################
dat <- read.csv ("Allsamples_autosomes_RG_100kb_cummulative_final.csv", header=TRUE)
dat2 <- subset(dat, Length.bp. > 100000)

#count number of ROH for each wolf
library(dplyr)
library(plyr)

my_summary <- count(dat2, "Sample")

dat2 %>% 
    count("Sample")

dat <- read.csv ("Dec26_ROH_in_cateogries_by_ROH_frohvssroh_final.csv", header=TRUE)


# Basic scatter plot
ggplot(dat, aes(x=numberROH, y=FROH, color=Sample)) + theme_classic() + geom_point(size=2) + scale_color_manual(values=c("darkseagreen1", "darkseagreen1", "darkseagreen1", "darkseagreen4", "maroon4", "maroon4", "royalblue", "darkseagreen1", "royalblue", "darkseagreen4", "darkseagreen4", "royalblue", "royalblue", "royalblue", "royalblue", "royalblue", "royalblue", "royalblue", "darkseagreen1", "darkseagreen1", "darkseagreen1", "darkgreen", "green2", "orange2", "orange2", "darkseagreen1", "darkseagreen1", "darkseagreen1", "darkseagreen1", "darkseagreen1", "green2", "green2", "darkseagreen1", "darkseagreen1", "darkseagreen1", "darkseagreen1", "darkseagreen1", "darkseagreen1", "darkseagreen1", "orange2", "orange2", "darkseagreen1", "darkseagreen1"))

# Change the point size, and shape
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(size=2, shape=23)

ggplot(dat, aes(fill=categoryROH, y=percent, x=label_by_region)) + 
    geom_bar(position="stack", stat="identity") + theme_classic()

#######################################
### Plotting Cummulative ROH Figure ###
#######################################
dat <- read.csv ("Allsamples_autosomes_RG_100kb_final.csv", header=TRUE)

#put in order
dat_order <- dat %>%
  group_by(Sample, Length.bp.) %>%
  mutate(across(everything(), sort)) %>%
  arrange(Sample,Length.bp.)

# Make cummulative plot in excel
dat <- read.csv ("Allsamples_autosomes_RG_100kb_cummulative_final.csv", header=TRUE)
dat2 <- subset(dat, Length.bp. > 100000) #get rid of ROH below 100kb

#Plot the graph
p <- ggplot(dat2, aes(x=Length.bp., y=Cummulative_by_sample, color=Sample)) + theme_classic() + scale_x_log10() +
  geom_line(linewidth=1.2, alpha=0.75) + scale_color_manual(values=c("yellowgreen", "yellowgreen", "yellowgreen", "darkseagreen4", "maroon4", "maroon4", "royalblue", "yellowgreen", "royalblue", "darkseagreen4", "darkseagreen4", "royalblue", "royalblue", "royalblue", "royalblue", "royalblue", "royalblue", "royalblue", "yellowgreen", "yellowgreen", "yellowgreen", "darkgreen", "green2", "orange2", "orange2", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "green2", "green2", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "orange2", "orange2", "yellowgreen", "yellowgreen"))
p
q <- p + geom_line(aes(size = Bold))  +
  scale_size_manual(values = c(0.1, 2.5)) + theme(axis.text.x = element_text(color="black", size = 15), axis.text.y = element_text(color="black", size = 15))
q 
ggsave("Jan3_2024_ROHcummulative.tiff", width=14,height=6)
