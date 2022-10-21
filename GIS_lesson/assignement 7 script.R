install.packages(c("sp","rgdal","raster","rgeos","geosphere","dismo"))

require(tidyverse)
library(sp)
library(rgdal)
library(raster)
library(rgeos)
library(geosphere)
library(dismo)

bio1<- raster("GIS_lesson/WORLDCLIM_Rasters/wc2.1_10m_bio_1.tif")

plot(bio1)

biol1_f <- bio1*9/5+32
plot(biol1_f)

clim_stack <- stack(list.files("GIS_lesson/WORLDCLIM_Rasters", full.names = TRUE, pattern = ".tif"))

list.files("GIS_lesson/WORLDCLIM_Rasters", full.names = TRUE, pattern = ".tif")

plot(clim_stack, nc = 5)

clim_stack

my_clim_stack <- stack(raster("GIS_lesson/WORLDCLIM_Rasters/wc2.1_10m_bio_5.tif"), raster("GIS_lesson/WORLDCLIM_Rasters/wc2.1_10m_bio_6.tif"), raster("GIS_lesson/WORLDCLIM_Rasters/wc2.1_10m_bio_18.tif"))

plot(my_clim_stack)

names(my_clim_stack) <- c("max_temp", "min_temp", "precip_warmest_qt")

pairs(my_clim_stack)

countries <- shapefile("GIS_lesson/Country_Shapefiles/ne_10m_admin_0_countries.shp")

plot(countries, col = "goldenrod", boarder = "black")

dev.new()

plot(my_clim_stack[[3]])

my_sites <- as.data.frame(click(n=10))

names(my_sites) <- c("longitude", "latitude")

my_sites

env <- as.data.frame(extract(my_clim_stack, my_sites))

env

my_sites <- cbind(my_sites, env)

my_sites

myCRS <- projection(my_clim_stack)

myCRS

my_sites_shape <- SpatialPointsDataFrame(coords = my_sites, data = my_sites, proj4string = CRS(myCRS))

plot(my_clim_stack[[2]])

points(my_sites_shape, pch = 16)

#now to generate a set of random points to compare vs our selected points

bg <- as.data.frame(randomPoints(my_clim_stack, n = 10000))

head(bg)

names(bg) <- c("longitude", "latitude")

plot(my_clim_stack[[2]])

points(bg, pch = '.')

bgEnv <- as.data.frame(extract(my_clim_stack, bg))

head(bgEnv)

bg <- cbind(bg, bgEnv)

bg <- bg[, 1:5]

head(bg)

pres_bg <- c(rep(1, nrow(my_sites)), rep(0, nrow(bg)))

pres_bg


train_data <- data.frame (pres_bg = pres_bg, rbind(my_sites, bg))

head(train_data)

my_model <- glm(
  pres_bg ~ max_temp*min_temp*precip_warmest_qt
  +I(max_temp^2) + I(min_temp^2) + I(precip_warmest_qt^2),
  data = train_data,
  family = "binomial",
  weights = c(rep(1, nrow(my_sites)), rep(nrow(my_sites)/nrow(bg), nrow(bg)))
  )                         

summary(my_model)

my_world <- predict(
  my_clim_stack,
  my_model,
  type = "response"
)

my_world

plot(my_world)
plot(countries, add =TRUE)
points(my_sites_shape, pch = 16)

writeRaster(my_world, "GIS_lesson/My_Climate_Space/my_world", format = "GTiff", overwrite = TRUE, progress = "text")

my_world_threshold <- my_world >= quantile(my_world, 0.75)

plot(my_world_threshold)

my_world_threshold <- calc(my_world_threshold, fun=function(x) ifelse(x==0 | is.na(x), NA, 1))

my_best_sites <- randomPoints(my_world_threshold, 10000)
my_best_env <- as.data.frame(extract(my_clim_stack, my_best_sites))

smoothScatter(x=bgEnv$min_temp, y=bgEnv$precip_warmest_qt, col='lightblue')
points(my_best_env$min_temp, my_best_env$precip_warmest_qt, col='red', pch=16, cex=0.2)
points(my_sites$min_temp, my_sites$precip_warmest_qt, pch=16)

legend(
  "topleft",
  inset=0.01,
  legend=c("world", "my niche", "my locations"),
  pch = 16,
  col = c("lightblue", "red", "black"),
  pt.cex = c(1,0.4,1)
)
  
  