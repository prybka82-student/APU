setwd('C:/Users/piotr/Desktop/Uczenie maszynowe/Zadania/Zadanie 5')

# dokumentacja
# https://mlr.mlr-org.com/
# https://cran.r-project.org/web/packages/mlr/vignettes/mlr.html

# zbior danych
# https://www.rdocumentation.org/packages/MASS/versions/7.3-53/topics/Pima.tr

install.packages('libcoin', dependencies = T)
install.packages('C50', dependencies = T)
library("C50")
library("MASS")

data("Pima.tr2")

head(Pima.tr2)

treeModel <- C5.0(x=Pima.tr2[,-6], y=Pima.tr2$type)
treeModel

summary(treeModel)

plot(treeModel)

