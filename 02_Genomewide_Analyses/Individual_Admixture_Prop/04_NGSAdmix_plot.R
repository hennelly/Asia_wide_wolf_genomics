## NGSAdmix results
library(ggplot2)
library(tidyverse)
library(dplyr)
#K=2
dat <- read.csv ("Jan1_NGS_K2.csv", header=TRUE)
## Organize the dataset
data_long <- gather(dat, Admixture, Percentage, A1:A2, factor_key=TRUE)

q <- ggplot(data_long, aes(fill=Admixture, y=Percentage, x=Names)) + 
    geom_bar(position="stack", stat="identity") +scale_fill_manual(values = c("mediumseagreen","maroon4", "orange2", "royalblue4", "red", "honeydew4")) 
q + theme(axis.text.x = element_text(angle = 90, hjust = 1))
p <- q + theme_classic()
p
ggsave("Jan3_2024_K2.tiff", width=14,height=2)

#K=3
dat <- read.csv ("Jan1_NGS_K3.csv", header=TRUE)
dat <- read.csv ("Feb9_NGS_chrX_K3.csv", header=TRUE)

data_long <- gather(dat, Admixture, Percentage, A1:A3, factor_key=TRUE)

q <- ggplot(data_long, aes(fill=Admixture, y=Percentage, x=Names)) + 
    geom_bar(position="stack", stat="identity") +scale_fill_manual(values = c("mediumseagreen","deepskyblue3", "maroon4", "maroon4", "red", "honeydew4")) 
q + theme(axis.text.x = element_text(angle = 90, hjust = 1))
p <- q + theme_classic()
p
ggsave("Jan3_2024_K3.tiff", width=14,height=2)

#K=4
dat <- read.csv ("Jan1_NGS_K4.csv", header=TRUE)
dat <- read.csv ("Feb9_NGS_chrX_K4.csv", header=TRUE)

data_long <- gather(dat, Admixture, Percentage, A1:A4, factor_key=TRUE)

q <- ggplot(data_long, aes(fill=Admixture, y=Percentage, x=Names)) + 
    geom_bar(position="stack", stat="identity") +scale_fill_manual(values = c("mediumseagreen","maroon4", "deepskyblue3", "bisque3", "red", "honeydew4")) 
q + theme(axis.text.x = element_text(angle = 90, hjust = 1))
p <- q + theme_classic()
p
ggsave("Jan3_2024_K4.tiff", width=14,height=2)

#K=5
dat <- read.csv ("Jan1_NGS_K5.csv", header=TRUE)
dat <- read.csv ("Feb9_NGS_chrX_K5.csv", header=TRUE)

data_long <- gather(dat, Admixture, Percentage, A1:A5, factor_key=TRUE)

pdf ("Admixture_K5_June5.pdf", height=2.5, width=8) #save as pdf
q <- ggplot(data_long, aes(fill=Admixture, y=Percentage, x=Names)) + 
    geom_bar(position="stack", stat="identity") +scale_fill_manual(values = c("mediumseagreen","orange2", "darkgreen", "maroon4", "deepskyblue3", "darkgreen")) 
q + theme(axis.text.x = element_text(angle = 90, hjust = 1))
p <- q + theme_classic()
p
ggsave("Jan3_2024_K5.tiff", width=14,height=2)

#K=6
dat <- read.csv ("Jan1_NGS_K6.csv", header=TRUE)
dat <- read.csv ("Jan27_NGS_K6_chrX.csv", header=TRUE)
dat <- read.csv ("Jan27_NGS_K6_chr10.csv", header=TRUE)
dat <- read.csv ("Feb9_NGS_chrX_K6.csv", header=TRUE)

data_long <- gather(dat, Admixture, Percentage, A1:A6, factor_key=TRUE)

pdf ("Admixture_K6_June5.pdf", height=2.5, width=8) #save as pdf
q <- ggplot(data_long, aes(fill=Admixture, y=Percentage, x=Names)) + 
    geom_bar(position="stack", stat="identity") +scale_fill_manual(values = c("deepskyblue3","bisque3", "orange2", "maroon4", "darkgreen", "mediumseagreen")) 
q + theme(axis.text.x = element_text(angle = 90, hjust = 1))
p <- q + theme_classic()
p
ggsave("Jan3_2024_K6.tiff", width=14,height=2)

#K=7
dat <- read.csv ("Jan1_NGS_K7.csv", header=TRUE)
data_long <- gather(dat, Admixture, Percentage, A1:A7, factor_key=TRUE)

pdf ("Admixture_K7_June5.pdf", height=2.5, width=8) #save as pdf
q <- ggplot(data_long, aes(fill=Admixture, y=Percentage, x=Names)) +
    geom_bar(position="stack", stat="identity") +scale_fill_manual(values = c("bisque3","orange2", "lightgreen", "mediumseagreen", "deepskyblue3", "darkgreen", "maroon4")) 
q + theme(axis.text.x = element_text(angle = 90, hjust = 1))
p <- q + theme_classic()
p
ggsave("Jan3_2024_K7.tiff", width=14,height=2)

#K=8
dat <- read.csv ("Jan1_NGS_K8.csv", header=TRUE)
data_long <- gather(dat, Admixture, Percentage, A1:A8, factor_key=TRUE)

pdf ("Admixture_K7_June5.pdf", height=2.5, width=8) #save as pdf
q <- ggplot(data_long, aes(fill=Admixture, y=Percentage, x=Names2)) +
    geom_bar(position="stack", stat="identity") +scale_fill_manual(values = c("mediumseagreen","deepskyblue3","maroon4", "bisque3", "orange2", "lightgreen", "olivedrab3", "darkgreen")) 
q + theme(axis.text.x = element_text(angle = 90, hjust = 1))
p <- q + theme_classic()
p + theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("Jan3_2024_K8_again.tiff", width=14,height=4.5)

#Log Likelihoods 
dat <- read.csv ("NGSAdmix_likelihoods.csv", header=TRUE)

pdf ("NGSAdmix_loglikelihoods_June5.pdf", height=5, width=6) #save as pdf
q <- ggplot(dat, aes(y=Loglike, x=K, group=K)) +
    geom_point(size=3) + theme_classic() + theme(axis.text.x = element_text(color="black", size = 15))
q
ggsave("Jan3_2024_likelihoods.tiff", width=6,height=5)

