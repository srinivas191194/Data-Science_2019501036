football<-read.csv("football.csv", header=TRUE)

plot(football[,2],football[,3],xlim=c(0,12),ylim=c(0,12),
     pch=15,col="blue",xlab="2003Wins",ylab="2004 Wins",main="Football Wins (srinivas)")

abline(c(0,1))

cor(football[,2],football[,3])

cor(football[,2],football[,3]+10)

cor(football[,2],football[,3]*2)

cor(football[,2],football[,3]*-2)