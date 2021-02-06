setwd('C:/Users/piotr/Desktop/Uczenie maszynowe/Zadania/Zadanie 4')

library(MASS)

install.packages('caret')
library(caret)

install.packages('libcoin', dependencies = T)
install.packages('C50', dependencies = T)
library(C50)

smartphones <- read.csv("smartphones.csv", sep = ';')

head(smartphones)

smartphones_tree <- C5.0(smartphones[,-5], as.factor(smartphones[,5]))

summary(smartphones_tree) 

plot(smartphones_tree, main = 'Drzewo wyboru') 
smartphones_tree_rules <- C5.0(smartphones[,-5], as.factor(smartphones[,5]), rules = TRUE) 
summary(smartphones_tree_rules) 

