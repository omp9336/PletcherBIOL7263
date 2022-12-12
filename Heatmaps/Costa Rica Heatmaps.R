install.packages("stats")
install.packages("ggplots2")

library(stats)
library(ggplot2)

species_data <- read.csv("Heatmaps/species_data.csv")
species_data2 <- read.csv("Heatmaps/species_data2.csv")



ggplot(species_data2, aes(x = Forest, y = Species, fill = Percent)) +
  geom_tile(colour="black", linewidth=0.5)+
  scale_fill_gradient(low = "black", high = "green")+ 
  theme_grey(base_size=12)+ 
  theme(axis.ticks = element_blank(), 
        plot.background = element_blank(), 
        panel.background = element_blank(),
        panel.border = element_blank())


ggplot(species_data2, aes(x = ordered(Forest, levels = c("Old", "Medium", "New")), y = reorder(Species, Percent), fill = Percent)) +
  geom_tile(colour="black", linewidth=0.5)+ 
  scale_fill_gradient(low = "black", high = "green")+
  theme_grey(base_size=12)+
  ggtitle(label = "Species Present") +
  theme(plot.title = element_text(face="bold"),
        legend.title = element_text(face = "bold"),
        axis.title = element_blank(),
        axis.text.y =element_text(color = "black"), 
        axis.text.x =element_text(angle = 270, hjust = 0, color = "black"), 
        axis.ticks= element_blank(),
        plot.background=element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank())


family1 <- read.csv("Heatmaps/Family1.csv")


ggplot(family1, aes(x = ordered(Forest, levels = c("High", "Med", "Low")), y = reorder(Family, Percent), fill = Percent)) +
  geom_tile(colour="black", linewidth=0.5)+ 
  scale_fill_gradient(low = "black", high = "skyblue")+
  theme_grey(base_size=12)+
  theme(plot.title = element_text(face="bold"),
        legend.title = element_text(face = "bold"),
        axis.title = element_blank(),
        axis.title.x = element_blank(),
        axis.text.y =element_text(color = "black"),
        axis.text.x =element_text(color = "black"),
        axis.ticks=element_blank(),
        plot.background=element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank())
