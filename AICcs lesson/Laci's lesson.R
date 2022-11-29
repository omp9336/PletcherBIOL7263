install.packages("ggfortify")
install.packages("devtools")
install.packages("devtools")
install.packages("rgl")
install.packages("pca3d")

str(iris)

summary(iris)

group_species <-factor(iris$Species,
                       levels = c("versicolor", "virginica", "setosa"))

summary(group_species)

round(cor(iris[, 1:4]), 2)

iris_pca <- prcomp(iris[1:4],
                   center = TRUE,
                   scale. = TRUE,
                   cor = TRUE,
                   scores = TRUE)


summary(iris_pca)

iris_pca

library(ggfortify)

iris_pca_plot <- autoplot(iris_pca,
                          data = iris,
                          colour = "Species"
                          )

iris_pca_plot

iris_pca_screen <- plot(iris_pca, type = "lines")

iris_pca_biplot <- biplot(iris_pca)

library(pca3d)

