setwd("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment2")

CALIFORNIA_data <- read.csv("CA_house_prices.csv",header=FALSE)

OHIO_data <- read.csv("OH_house_prices.csv",header=FALSE)

boxplot(CALIFORNIA_data[,1],OHIO_data[,1],col="red",main="srinivas Boxplot",
          names=c("CA houses","Ohio houses"),ylab="Prices (in thousands)")

hist(CALIFORNIA_data[,1]*1000,breaks=seq(0,3500000,by=500000),
     col="red",xlab="Prices",ylab="Frequency",main="srinivas CA House Plot")

plot(ecdf(CALIFORNIA_data[,1]),verticals= TRUE,do.p = FALSE,main ="ECDF for House Prices(srinivas)",
     xlab="Prices (in thousands)",ylab="Frequency")

lines(ecdf(OHIO_data[,1]),verticals= TRUE,do.p = FALSE,col.h="red",col.v="red",lwd=4)

legend(2100,.6,c("CA Houses","OH Houses"), col=c("black","red"),lwd=c(1,4))


