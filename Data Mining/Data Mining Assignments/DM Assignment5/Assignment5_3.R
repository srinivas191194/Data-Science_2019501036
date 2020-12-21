library(class)

train_data = read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment5\\sonar_train.csv")
test_data =  read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment5\\sonar_test.csv")

k = test_data[, 1:2]

plot(k, pch = 19, xlab = expression(k[1]), ylab = expression(k[2]))

fit = kmeans(k, 2)

fit

points(fit$centers, pch = 19, col = "blue", cex=2)
c(-1,1)
knnfit = knn(fit$centers, k, as.factor(c(-1,1)))
points(k, col = 1+1*as.numeric(knnfit), pch=19)

output = test_data[,61]
1-sum(knnfit == output)/length(output)