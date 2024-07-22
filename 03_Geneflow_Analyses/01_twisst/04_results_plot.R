# Prep in Farm:

#Move to local computer
scp -r hennelly@farm.cse.ucdavis.edu:/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/output/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml_twisst_EastAsia.csv ~/Desktop
scp -r hennelly@farm.cse.ucdavis.edu:/group/ctbrowngrp2/hennelly/hennelly/Asianwolves/phyml/gatk_chrX_filtered_noindels_noastrick_diploid_minQ30_biallelic_maxmiss0.9.final_July21.phyml.data.tsv ~/Desktop

                    ##### Step One: Load package and data ####
#### Load packages
library(ggplot2)
library(cowplot)
library(scales)

### Load data
weights <- read.csv ("twisst_chrX_EastAsia.csv" , header=TRUE)

                    ##### Step Two: Normalize weights #####

#normalise rows so weights sum to 1
weights <- weights / apply(weights, 1, sum)
colMeans(weights)

write.csv (weights, "output.weights_chrX_EastAsia_July22_normalised.csv")

# plot average 
dat <- read.csv("output.weights_chrX_EastAsia_July22_normalised.csv", header=TRUE)

#plot across X chromosome
x <- ggplot(dat, aes(start, topo10)) + xlab("Position along chromosome") + theme_classic() + stat_smooth(geom = 'area', method = 'loess', span=0.002, alpha=0.4, color="black",size=0.25 ) + guides(fill=FALSE)
x





