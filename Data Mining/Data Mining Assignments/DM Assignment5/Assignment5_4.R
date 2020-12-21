library(class)

train_data = read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment5\\sonar_train.csv")
test_data =  read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment5\\sonar_test.csv")

k = test_data[, 1:60]
fit = kmeans(k, 2)
points(fit$centers, pch = 19, col = "red", cex=2)

knnfit = knn(fit$centers, k, as.factor(c(-1,1)))
points(kAll, col = 1+1*as.numeric(knnfit), pch=19)

output = test_data[,61]
1-sum(knnfit == output)/length(output)