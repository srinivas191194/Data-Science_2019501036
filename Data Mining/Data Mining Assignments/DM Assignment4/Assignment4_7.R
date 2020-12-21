library(rpart)

library(randomForest)

train_data = read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment4\\sonar_train.csv")
test_data =  read.csv("D:\\msit\\Data-Science_2019501036\\Data mining\\Data Mining Assignments\\DM Assignment4\\sonar_test.csv")

output = randomForest(nativeSpeaker ~ age + shoeSize + score, data = readingSkills)
output

