library(stats)
library(ggplot2)

pheromone_data <- read.csv("Pletcher Lesson/pheromone_data.csv")

pheromone_data1 <- as.matrix(pheromone_data[,-1])

rownames(pheromone_data1) <- pheromone_data[,1]

heatmap(pheromone_data1)

heatmap(pheromone_data1,
        Colv = NA,
        Rowv = NA,
        margins = c(7,5),
        cexCol = 1, 
        col = terrain.colors(10),
        main = "Pheromone Gene Expression",
        xlab = "groups",
        ylab = "genes")

pher_data2 <- read.csv("Pletcher Lesson/pheromone_data2.csv")

print(pher_data2)

ggplot(pher_data2,
       aes(x = Sample, y = Gene, fill = Expression)) +
  geom_tile()

ggplot(pher_data2,
       aes(x = Sample, y = Gene, fill = Expression)) +
  geom_tile(colour = "black", size = .8) +
  scale_fill_gradient(low = "black", high = "tan") +
  ggtitle(label = "Pheromone Gene Expression of some 'Manders")
  theme_grey(base_size = 12) +
  theme(axis.ticks = element_blank(),
        plot.background = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank())













