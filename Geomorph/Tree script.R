install.packages("phytool")

install.packages("geiger")

install.packages("diversitree")

install.packages("mapplots")

require(phytools)

require(geiger)

require(diversitree)

require(mapplots)

phylo1 <- "((Caudata, Anura), Gymnophiona);"

Amphibians <- read.tree(text=phylo1)

plotTree(Amphibians, ftype = "reg")

add.arrow(Amphibians=NULL, tip=1, offset=8)

phylo2<-
  "(((((((cow, pig),whale),(bat,(lemur,human))),(blue_jay,snake)),coelacanth),gold_fish),lamprey);"

vert_tree<-read.tree(text=phylo2)

plotTree(vert_tree, ftyp = "reg")

plot(vert_tree, no.margin = TRUE, edge.width = 3)

plot(vert_tree, edge.color = "blue", label.offset = 0.2, type = "cladogram")

plot(unroot(vert_tree), type = "unrooted", no.margin = TRUE, edge.width = 2)

Salamanders<-
  "(((((((Amphiumidae,Plethodontidae),Rhyacotritonidae),((Ambystomatidae,Dicamptodontidae),Salamandridae)),Proteidae)),Sirenidae),(Hynobiidae,Cryptobranchidae));"

Mander.tree<-read.tree(text=Salamanders)

plot(Mander.tree, label.offset = 0.2)

Ntip(Mander.tree)

drop <- drop.tip(Mander.tree, 8)

plot(drop)

time_calibrated<-read.tree("~/Seminar 2022/PletcherBIOL7263/Geomorph/time_cal")

plot(time_calibrated)

SallyTree<-read.nexus("")
