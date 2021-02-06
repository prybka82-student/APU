smartfony <- read.csv("xiaomi.csv")
normalize <- function(x) 
{
  return ((x^2)-(exp(-x)))
}
cena <- smartfony$Cena
smartfony <- smartfony[,-8]
smartfony <- smartfony[,-5]
smartfony <- smartfony[,-1]
smartfony <- cbind(smartfony, cena)
smartfony[,2:6] <- as.data.frame(lapply(smartfony[,2:6], normalize))
net.price <- neuralnet(cena~wyswietlacz+pamiec_RAM+aparat_foto+cena,
                       smartfony, hidden = c(6,4,4), threshold = 0.01)
plot(net.price, cex=0.8)
