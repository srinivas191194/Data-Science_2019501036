setwd("D:\\msit\\Data-Science_2019501036\\Data Mining\\Final exam")




lensinputdata = read.csv("lenses.data.csv", header = FALSE, col.names = c("index", "age", "spectacle_prescription", "astigmatic", "tear_production_rate", "Class"))

lensinputdata$index <- NULL

library(rpart)
z<-as.factor(lensdata[,5])
x<-lensinputdata[,1:4]

model1<-rpart(z~.,x, parms = list(split = 'information'),
              control=rpart.control(minsplit=0,minbucket=0,cp=-1, maxcompete=0, maxsurrogate=0, usesurrogate=0, xval=0,maxdepth=5))


library(rpart.plot)
rpart.plot(model1)
gain <- sum(z==predict(model1,x,type="class"))/length(z)

gain
error_rate <- 1-sum(z==predict(model1,x,type="class"))/length(z)

error_rate