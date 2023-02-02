#3.1
data<-c(60, 85, 72, 59, 37, 75, 93, 7, 98, 63, 41, 90, 5, 17, 97)
sort(data)
stem(data)

#3.3
x<-rnorm(100)
y<-rnorm(100)

hist(x)
hist(y)
#No

#3.4
library(UsingR)
head(south)
head(crime)
head(aid)

simple.hist.and.boxplot(south)
simple.hist.and.boxplot(crime$y1983)
simple.hist.and.boxplot(crime$y1993)

#3.5
head(bumpers)
hist(bumpers)
summary(bumpers)

#3.7
hist(pi2000)
table(pi2000)
table(pi2000)/length(pi2000)
prop.table(table(pi2000)) #table of proportions; same as above
proportions(table(pi2000)) #same as above

#3.8
density(pi2000)
hist(pi2000, probability = TRUE)
lines(density(pi2000), lwd=2)
