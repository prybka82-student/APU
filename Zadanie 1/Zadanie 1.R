#a
a <- 10/exp(1)
b <- 2*a
m1 <- max(a,b)
m2 <- a>b
m3 <- a<b

#b
help(sin)

#c
vec <- c(80:145)
avg <- mean(vec)

#d
??min

#e
setwd("C:/Users/piotr/Desktop/Uczenie maszynowe/Zadania/Zadanie 1")
a <- "smartfon Xiaomi"
write(a, file='smartfon.csv')
rm(a)
a
a <- read.csv(file='smartfon.csv',sep=)
a[1:1]

#f
install.packages("gridExtra")
library("gridExtra")
gridExtra::grid.table(quakes[1:10,])

#g
a <- seq(300, 220, -8)

#h
a <- seq(40, 30, -1)
a <- c(40:10)
b <- seq(20, 45, 1)
b <- c(20:45)
d <- c(b, a) #polaczenie a b 
d

#i
nazwy <- c('tel 1', 'tel 2','tel 3',
            'tel 4', 'tel 5', 'tel 6',
            'tel 7', 'tel 8', 'tel 9',
            'tel 10')
wyswietlacz <- c(10, 10, 10, 30, 30, 20, 20, 14, 14, 13)
pamiec_RAM <- c(20, 30, 40, 10, 10, 20, 30, 40, 30, 20)
pamiec_wbudowana <- c(100, 100, 200, 200, 300, 400, 400, 100, 100, 100)
aparat_foto <- c(TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE)
cena <- c(1000, 2000, 3000, 2400, 2500, 3000, 2400, 3000, 1000, 2000)
liczba_opinii <- c(20, 24, 34, 45, 45, 56, 47, 34, 24, 14)
smartfony <- data.frame(nazwy, wyswietlacz, pamiec_RAM, pamiec_wbudowana, aparat_foto, cena, liczba_opinii)
srednia_cena <- mean(smartfony$cena) 

#j
nowy <- data.frame(nazwy = 'tel 11', wyswietlacz = 23, pamiec_RAM = 23, pamiec_wbudowana = 344, aparat_foto = TRUE, cena = 3400, liczba_opinii = 43)
smartfony <- rbind(smartfony, nowy)
srednia_cena_2 <- mean(smartfony$cena)

#k
smartfony$ocena <- seq(0, 5, 0.5)
aggregate(smartfony$cena, list(smartfony$ocena), mean)

#l
nowy1 <- data.frame(nazwy = 'tel 12', wyswietlacz = 22, pamiec_RAM = 23, pamiec_wbudowana = 344, aparat_foto = TRUE, cena = 3423, liczba_opinii = 43, ocena = 4.5)
nowy2 <- data.frame(nazwy = 'tel 13', wyswietlacz = 25, pamiec_RAM = 33, pamiec_wbudowana = 342, aparat_foto = TRUE, cena = 3404, liczba_opinii = 14, ocena = 3.5)
nowy3 <- data.frame(nazwy = 'tel 14', wyswietlacz = 14, pamiec_RAM = 25, pamiec_wbudowana = 355, aparat_foto = TRUE, cena = 3344, liczba_opinii = 34, ocena = 2.5)
nowy4 <- data.frame(nazwy = 'tel 15', wyswietlacz = 22, pamiec_RAM = 27, pamiec_wbudowana = 3566, aparat_foto = TRUE, cena = 2434, liczba_opinii = 54, ocena = 4.5)
smartfony <- rbind(smartfony, nowy1)
smartfony <- rbind(smartfony, nowy2)
smartfony <- rbind(smartfony, nowy3)
smartfony <- rbind(smartfony, nowy4)
dane <- aggregate(smartfony$liczba_opinii, list(smartfony$ocena),sum)
barplot(dane[,2], names.arg = dane[,1], main="Liczba ocen danej wartosci")

#m
#wykres kolowy
labels <- round(dane[,2], sum(dane[,2]) * 100, 1)
labels <- paste(labels, "%", sep="")

pie(dane[,2], radius=1, col=rainbow(length(dane[,2])),labels=labels)
legend(1,6, 0.8, dane[,1], cex=0.8, fill=rainbow(length(dane[,2])))

#wykres wachlarzowy
install.packages("plotrix")
library(plotrix)
percentage <- table(smartfony$ocena) / length(smartfony$ocena)
fan.plot(percentage, labels = names(percentage), main = "Proc. udzial ocen")

#n
new_column <- ifelse(smartfony$liczba_opinii>100,'wiecej 100 opinii',
                     ifelse(smartfony$liczba_opinii>=50,'50-100 opinii',
                            ifelse(smartfony$liczba_opinii>0,'mniej 50 opinii','nie ma')))
smartfony['status_opinii'] <- factor(new_column)

#wykres kolowy
pie(table(smartfony$status_opinii), radius = 1, col = rainbow(length(smartfony$status_opinii)))

#o
for (i in 1:length(smartfony$nazwy)){
  print(paste(smartfony$nazwy[i], " ma ocene klientow ", smartfony$ocena[i], ', bo ma liczbe opinii ', 
              smartfony$status_opinii[i]))
}

#p)
write.csv(smartfony, 'smartfony.csv')
dane <- read.csv('smartfony.csv')




