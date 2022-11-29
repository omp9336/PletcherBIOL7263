install.packages("ctv")

install.packages("spatstat")

install.packages("maptools")

install.packages("spatstat.geom")

library(maptools)
library(tidyverse)
library(spatstat)
library(spatstat.geom)

data("japanesepines")
data("redwood")
data("cells")

#as ppp or point pattern datasets
#cartesian corrdinates of points in a two-dimensional plane

plot(redwood, main = "redwood", axes = TRUE)
plot(japanesepines, main = "Japanese Pines", axes = TRUE)
plot(cells, main = "cells", axes = TRUE)

summary(japanesepines)

#or as Spatial Points
#not really sure how its different from ppp, possibly used for other analyses
spjpines <- as(japanesepines, "SpatialPoints")
sprwood <- as(redwood, "SpatialPoints")
spcells <- as(cells, "SpatialPoints")

coordinates(spjpines)
summary(spjpines)

plot(sprwood, main = "redwood", axes = TRUE)
plot(spjpines, main = "japanese pines", axes = TRUE)
plot(spcells, main = "cells", axes = TRUE)

#in both cases, redwoods look clustered, cells seem evenly spaced, and pines look to be random
#here are a few tests for Complete Spatial Randomness

#G function: Distance to Nearest Event
#start by 

r <- seq(0,)



