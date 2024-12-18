library(ggplot2)
library(maps)
install.packages("mapdata")
library(mapdata)
install.packages("rworldmap")
library(rworldmap)

dat <- read.csv ("final_Jan10_heterozgosity_locations.csv", header=TRUE)

world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
    geom_map(map=world, aes(map_id=region), fill="gray95", color="darkgray") +
    coord_quickmap() + theme_classic() 
 
q <- p +  geom_point(data = dat, 
             aes(x = Lat, y = Long, fill=Heterozygosity), 
             alpha = 1, 
             size = 2.5, shape = 21) +
   scale_fill_gradient(low = "yellow", high = "blue", na.value = NA) 

ggsave("Nov18_Heterozygosity_map.tiff", width=20,height=11)
