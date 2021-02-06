setwd('C:/Users/piotr/Desktop/Uczenie maszynowe/Zadania/Zadanie 2')

# dokumentacja: 
# https://github.com/gluc/ahp

devtools::install_github("gluc/ahp", build_vignettes = TRUE)
library(ahp)

ahp_file_data <- system.file("extdata", "Zadanie_2.ahp", package="ahp")

data <- Load(ahp_file_data)
Calculate(data)
Visualize(data)
Analyze(data)
AnalyzeTable(data)

