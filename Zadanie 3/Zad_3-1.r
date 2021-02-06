library("neuralnet")

normalize <- function(x) 
{
  return ((x)^(-1/4))
}

input <- as.data.frame(runif(100, min = 1, max = 10))
output <- exp(input^0.5)

trainingData <- cbind(input, output)
colnames(trainingData) <- c("Input", "Output")

datanorm <- as.data.frame(lapply(trainingData, normalize))

net.price <- neuralnet(Output~Input, datanorm, hidden = c(5, 3), threshold = 0.01)

plot(net.price)
