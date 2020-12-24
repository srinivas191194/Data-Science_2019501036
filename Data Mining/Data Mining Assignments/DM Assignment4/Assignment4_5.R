setwd("D:\\msit\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment4")

library(rpart)

train_data = read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment4\\sonar_train.csv", header = FALSE)
test_data =  read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment4\\sonar_test.csv", header = FALSE)

x_train = train_data[,1:60]
y_train = as.factor(train_data[,61])

x_test = test_data[,1:60]
y_test = as.factor(test_data[,61])

error = matrix(data = NA, nrow = 6, ncol = 3)

for(var in 1:6) {
  
  error[var, 1] = var
  fit <- rpart(y_train~., x_train, control = rpart.control(minsplit = 0, minbucket = 0, cp = -1, maxcompete = 0, xval = 0, maxdepth = var))
  error[var, 2] = sum(y_train!= predict(fit, x_train, type = "class"))/length(y_train)
  error[var, 3] = sum(y_test != predict(fit, x_test, type = "class"))/length(y_test)
  
}
val = error[which.min(error[,3]), 3]
round(val, 3)

depth = error[which.min(error[,3]), 1]
depth
library(rpart)
library(rpart.plot)

model <- rpart(y_test~.,x_test,control=rpart.control(minsplit=0,minbucket=0,cp=-1, maxcompete=0, maxsurrogate=0, usesurrogate=0, xval=0,maxdepth=5))
rpart.plot(model, box.palette="RdBu", shadow.col="orange", nn=TRUE,border="red",col="black")