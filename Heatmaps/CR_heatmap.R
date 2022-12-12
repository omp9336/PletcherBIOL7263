library(devtools)
install_github("jokergoo/ComplexHeatmap")
3


Species_data <-read.csv("Heatmaps/species_data.csv")

species_data1 <- as.matrix(Species_data [, -1])
rownames(species_data1) <- Species_data[,1]
