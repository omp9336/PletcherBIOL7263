
install.packages("AcuityView")

install.packages("magrittr")

install.packages("imager")

install.packages("fftwtolls")

library(AcuityView)

library(fftwtools)

library(imager)

img <- load.image('Mierow seminar assignment/inchworm.jpg')

dim(img)

img <- resize(img, 512, 512)

dim(img)

AcuityView(photo = img, 
           distance = 2, 
           realWidth = 1, 
           eyeResolutionX = 0.6, 
           eyeResolutionY = NULL, 
           plot = T, 
           output = "chickadee2.jpg" )
