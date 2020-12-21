library(class)

train_data = read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment4\\sonar_train.csv")
test_data =  read.csv("D:\\msit\\Data-Science_2019501036\\Data mining\\Data Mining Assignments\\DM Assignment4\\sonar_test.csv")

k = test_data[,1:2]
plot(k, pch = 19, xlab= expression(k[1]), ylab= expression(k[2]))

k_mean_fit = kmeans(k, 2)

points(k_mean_fit$centers, pch = 19, col = "red", cex = 2)
knnfit = knn(k_mean_fit$centers, k, as.factor(c(-1, 1)))
points(k, col=1+1*as.numeric(knnfit), pch = 19)
var = test_data[,61]
1-sum(knnfit == var)/length(var)


#8-b
#we can select any value for k, but if we opt for an odd value, then we get ambiguity and the error may increase.
#So, we should have odd number of clusters for even number of class in order to reduce the ambiguity
#in making a decision for the clusters