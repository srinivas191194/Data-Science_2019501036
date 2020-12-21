data = read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment5\\spring2008exams.csv")
model = lm(data$Midterm.2 ~ data$Midterm.1)
plot(data$Midterm.1, data$Midterm.2, pch = 19, xlab ="Exam 1", ylab = "Exam 2", xlim = c(100, 200), ylim = c(100,200))

abline(model)
sort(model$residuals)