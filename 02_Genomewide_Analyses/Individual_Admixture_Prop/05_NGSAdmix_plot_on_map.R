library("rnaturalearth")
library("rnaturalearthdata")
library(maps)
library(ggplot2)

dat1 <-  read.csv("May30_NGS_K6_ADMIXTUREFORMAP.csv", header=TRUE)


dat <- read.csv ("final_Jan10_heterozgosity_locations.csv", header=TRUE)

world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

world <- map_data('world')
p <- ggplot(world, aes(lat, long)) +
    geom_map(map=world, aes(map_id=region), fill="gray95", color="darkgray") +
    coord_quickmap() + theme_classic() 
 
p + geom_scatterpie(aes(x=lat, y=long, r=2),
                    data=dat1, cols=c("A", "B", "C", "D", "E", "F"), color="black") + scale_fill_manual(values = c("deepskyblue3","bisque3", "orange2", "maroon4", "mediumseagreen", "#B6EEB2", "blue", "gray", "red", "gray", "gray", "gray", "blue", "yellow"))
ggsave("map.tiff", width=20,height=11)
