library(maps)
install.packages("mapdata")
library(mapdata)
install.packages("rworldmap")
library(rworldmap)
install.packages("scatterpie")
library(mapplots)
library(ggplot2)
library(scatterpie)
library(ggrepel)

dat <- read.csv("July21plot.csv", header=TRUE) # modern dogs
dat$Lat <- as.numeric(dat$Lat)
## MODERN DOGS ##

world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
    geom_map(map=world, aes(map_id=region), fill="lightgray", color=NA) +
    coord_quickmap() + theme_classic() 

q <- p +
    geom_point(data = dat, aes(x = Long, y = Lat, fill = Dstat), size=4,
        shape = 21) +
  scale_fill_gradient2(low = "orangered", mid = "gold", high = "darkslategray3", midpoint = mean(0)) 

r <- q  +
  theme(line = element_blank(),
        text = element_blank(),
        title = element_blank()) +
        scale_x_continuous(limits = c(10, 180))+
        scale_y_continuous(limits = c(20, 80)) 
r


ggsave("July21_map_tibetanwolf_dstatistic.tiff", width=14,height=8) 
