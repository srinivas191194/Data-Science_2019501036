library(dplyr)
inputdata <- read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Final exam\\BSE_Sensex_Index.csv", header = TRUE)
closed <- inputdata[['Close']]
fc <- function(closed) {
  a <- numeric()
  for (i in 1:length(closed)-1) {
    a <- c(a, (closed[i] - closed[i+1])/closed[i+1])
  }
  a
}

ans <- fc(closed)
lastval <- (ans[length(ans)] + ans[length(ans)-1]+ans[length(ans)-2])/3
ans = append(ans, lastval)
mean = mean(ans)
std = sd(ans)

fc = function(ans) {
  
  d = numeric()
  
  for (i in 1:length(ans)) {
    
    d = c(d, (ans[i]-mean)/std)
  }
  d
}

d = fc(ans)

inputdata$sdclose = d
output = filter(data, sdclose <- 3 & sdclose > 3)

head(output)

output[,1]