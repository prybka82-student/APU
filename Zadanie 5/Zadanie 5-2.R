
install.packages('mlr', dependencies = T)
library(mlr)

nazwa <- c("smartphone1", "smartphone2", "smartphone3", 
           "smartphone4", "smartphone5", "smartphone6", 
           "smartphone7", "smartphone8", "smartphone9", 
           "smartphone10")

wyswietlacz <-c(6.1, 6.4, 5.0, 5.3, 5.6, 5.3, 5.3, 6.0, 6.6, 6.9)

pamiec_RAM <-c(4, 4, 6, 2, 8, 6, 8, 2, 4, 3)

pamiec_wbudowana <-c(64, 64, 128, 64, 64, 128, 64, 64, 64, 32)

aparat_foto <-c(48, 25, 16, 64, 48, 16, 64, 25, 48, 16)

ocena_klientow <- c(5, 1, 5, 1, 4, 5, 5, 1, 2, 5)

cena <-c(1277, 3942, 755, 2407, 2645, 3739, 1012, 3851, 2345, 2842)

liczba_opinii <-c(34, 30, 23, 49, 4, 37, 18, 85, 48, 4)

smartfony <- data.frame(wyswietlacz, pamiec_RAM, pamiec_wbudowana, aparat_foto, ocena_klientow)

rdesc = makeResampleDesc(method = "CV", stratify = F)

smartfony$ocena_klientow <- as.factor(smartfony$ocena_klientow)

classif.task = makeClassifTask(id = "smartfony - ocena klientow - MMCE", data = smartfony, target = "ocena_klientow", fixup.data = "no")
classif.task

listLearners("classif")[c("class", "package")]

classif.learners = makeLearners(c("nnet", "lda", "randomForest", "C50", "rpart"), type = "classif", fix.factors.prediction=TRUE)

classif.comparison = benchmark(learners = classif.learners, tasks = classif.task, resamplings = rdesc)

classif.comparison

getBMRAggrPerformances(classif.comparison)
getBMRPerformances(classif.comparison)
plotBMRBoxplots(classif.comparison)



