data = read.csv("D:\\msit\\Data-Science_2019501036\\Data Mining\\Data Mining Assignments\\DM Assignment5\\spring2008exams.csv")
exam_mean = mean(data[,3], na.rm = TRUE)
exam_sd = sd(data[,3], na.rm = TRUE)
out = (data[,3] - exam_mean)/exam_sd
sort(out)