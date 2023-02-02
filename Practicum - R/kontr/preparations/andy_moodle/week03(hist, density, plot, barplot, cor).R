#zad 1
library(MASS)
mean(survey$Height, na.rm=TRUE)
sd(survey$Height, na.rm = TRUE)

mean(survey[survey$Sex == "Male", "Height"], na.rm=TRUE)
mean(survey[survey$Sex == "Female", "Height"], na.rm=TRUE)

sd(survey[survey$Sex == "Male", "Height"], na.rm=TRUE)
sd(survey[survey$Sex == "Female", "Height"], na.rm=TRUE)

height.clean<-survey$Height[!is.na(survey$Height)]
height.standardized<-abs(height.clean-mean(height.clean))/sd(height.clean)
sum(height.standardized<1)/length(height.clean)

sum(height.standardized<2)/length(height.clean)

sum(height.standardized<3)/length(height.clean)

hist(survey$Height, 
     main = "Histogram for height of students", #title of histogram 
     xlab = "Height", #X axis title, 
     ylab = "Frequency") #Y axis title
rug(jitter(survey$Height)) #toj dole kude ima valjda gustina 
     
h<-hist(survey$Height, 
        main = "Histogram for height of students",  
        xlab = "Height",  
        ylab = "Frequency")
lines(x=c(min(h$breaks), h$mids, max(h$breaks)), #adding a poligon
      y=c(0, h$counts, 0),
      type = "l", 
      lwd = 2)
hist(height.clean, 
     main = "Density histogram and function of student height",
     xlab = "Height", 
     ylab = "Probability", 
     probability = TRUE)
rug(jitter(survey$Height))
lines(density(height.clean), #adding density line(pltnost)
      col = "red", 
      lwd = 2)

#zad 2
data<-read.table("Data.txt", header = TRUE)
head(data)

plot(data)
abline(lm(data$y~data$x))
cor(data&x, data$y)

#zad3
str(anscombe)
summary(anscombe)        
cor(anscombe[,1:4], anscombe[,5:8])
pairs(anscombe)
