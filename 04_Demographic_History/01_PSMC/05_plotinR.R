library(ggplot2)
library(tidyverse)

## Read in the data:
dat <- read.csv ("PSMC_Dec27_done_noQinghai.csv", header=TRUE)

## Grab only past 10K years ago
dat2 <- subset(dat, Time > 9000)

############################################################################
### Plotting PSMC with other gray wolf individuals to check parameters #####
############################################################################
## Read in the data:
dat <- read.csv ("July17_checkPSMC.csv", header=TRUE)

## Grab only past 10K years ago
dat2 <- subset(dat, Time > 9000)

## Plot correction
p <- ggplot(data=dat2, aes(x=Time, y=Ne, color=Population)) +
  geom_step(size=1, alpha=0.7) + theme_classic() + scale_x_log10() + scale_color_manual(values=c("maroon4", "darkseagreen4", "orange2", "darkseagreen4", "yellowgreen", "blue", "yellowgreen", "darkseagreen4", "green2", "maroon4", "lightseagreen", "lightseagreen", "lightseagreen", "lightseagreen", "lightseagreen", "lightseagreen", "lightseagreen", "lightseagreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "darkseagreen4", "lightseagreen", "green2", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "orange2", "orange2" ))
p + 
  facet_grid(Sample ~ .)

ggsave("July17_PSMC_testparameters.tiff", width=6,height=5)

###############################################################
### Plotting final PSMC with other gray wolf individuals  #####
###############################################################

## Only India and West Asia 
## Read in the data:
dat <- read.csv ("PSMC_Dec27_done_India_WestAsia.csv", header=TRUE)

## Grab only past 10K years ago
dat2 <- subset(dat, Time > 9000)

### Plotting PSMC with other gray wolf individuals
p <- ggplot(data=dat2, aes(x=Time, y=Ne, color=Sample)) +
  geom_step(size=1, alpha=0.7) + theme_classic() + scale_x_log10() + scale_color_manual(values=c("maroon4", "maroon4", "greenyellow", "lightseagreen", "seagreen", "cornflowerblue", "darkcyan", "green2", "dodgerblue", "darkturquoise", "darkturquoise", "lightseagreen", "lightseagreen", "lightseagreen", "lightseagreen", "lightseagreen", "lightseagreen", "lightseagreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "lightseagreen", "green2", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "yellowgreen", "orange2", "orange2" ))
p 
q <- p + geom_step(aes(size = LineThickness))  +
  scale_size_manual(values = c(0.1, 2))  
q + 
  theme(axis.text.x = element_text(color="black", size = 15), axis.text.y = element_text(color="black", size = 15), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", size=1)) 
