data = read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment5\\spring2008exams.csv")

q1 = quantile(data$Midterm.2, 0.75, na.rm = TRUE)
q3 = quantile(data$Midterm.2, 0.75, na.rm = TRUE)

interQuantile = q3 - q1

interQuantile

data[(data$Midterm.2 > q3 + 1.5 * interQuantile), 3]
data[(data$Midterm.2 > q1 - 1.5 * interQuantile), 3]
#boxplot(data$Midterm.2, col = "Red", main="Exam Scores", xlab=("Exam 2"), ylab = "Exam Score")
boxplot(data$Midterm.1,data$Midterm.2, col="yellow", main="Exam Scores", names=c("Exam 1 ","Exam 2"),ylab="Exam Score")