install.packages("geomorph")

library(geomorph)

data("plethodon")

Y.gpa <- gpagen(plethodon$land, print.progress = FALSE)

Ref <- mshape(Y.gpa$coords) 
  
plotRefToTarget(Ref, Y.gpa$coords[,,39], mag=3, method="TPS")

plotAllSpecimens(Y.gpa$coords, 
                 links=plethodon$links, label= T, 
                 plot.param = list(pt.bg ="green", mean.cex=1, link.col= "red", txt.pos=3, txt.cex=1))
