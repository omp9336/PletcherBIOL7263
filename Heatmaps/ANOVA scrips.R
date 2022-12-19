
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

Groupsize <- read.csv("Heatmaps/Tropical Ecology/FlockSizeANOVA.csv")

size.aov <- aov(Flock.Size ~ Complexity, data = Groupsize)

summary(size.aov)

TukeyHSD(size.aov)

ggplot(Groupsize, aes(x= ordered(Complexity, levels = c("High", "Med", "Low")), y=Flock.Size, fill=Complexity)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none",
        axis.title.x = element_blank()) +
  scale_fill_brewer(palette="BuPu")

NumSpecies <- read.csv("Heatmaps/Tropical Ecology/NumberSpeciesANOVA.csv")

spec.aov <- aov(Num.Spe ~ Complexity, data = NumSpecies)

summary(spec.aov)

TukeyHSD(spec.aov)

ggplot(NumSpecies, aes(x= ordered(Complexity, levels = c("High", "Med", "Low")), y=Num.Spe, fill=Complexity)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none",
        axis.title.x = element_blank()) +
  scale_fill_brewer(palette="BuPu")

Diversity <- read.csv("Heatmaps/Tropical Ecology/DiversityANOVA.csv")

div.aov <- aov(Shannon.s.I ~ Complexity, data = Diversity)

summary(div.aov)

TukeyHSD(div.aov)

ggplot(Diversity, aes(x= ordered(Complexity, levels = c("High", "Med", "Low")), y=Shannon.s.I, fill=Complexity)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none",
        axis.title.x = element_blank()) +
  scale_fill_brewer(palette="BuPu")
