library(rpart)

library(randomForest)

train_data = read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment4\\sonar_train.csv")
test_data =  read.csv("D:\\msit\\Data-Science_2019501036\\Data mining\\Data Mining Assignments\\DM Assignment4\\sonar_test.csv")

x_train = train_data[,1:60]
y_train = as.factor(train_data[,61])

x_test = test_data[,1:60]
y_test = as.factor(test_data[,61])

model<-randomForest(x_train, y_train)
1 - sum(y_train == predict(model, x_train)) / length(y_train)
