library(MASS)
data(survey)
attach(survey)

boxplot(Pulse~Exer)

boxplot(Pulse[Exer=="Freq"],
        Pulse[Exer=="None"],
        Pulse[Exer=="Some"])

median(Pulse[Exer=="Freq"], na.rm=T)
median(Pulse[Exer=="None"], na.rm=T)
median(Pulse[Exer=="Some"], na.rm=T)

mean(Pulse[Exer=="Freq"], na.rm=T)
mean(Pulse[Exer=="None"], na.rm=T)
mean(Pulse[Exer=="Some"], na.rm=T)

####
#scatter plot and correlation
x<-rnorm(100, 5,1)
y<-2*x
plot(x,y)
cor(x,y) #korelacija [-1,1]

x<-rnorm(100, 5,1)
y<-(-2)*x
plot(x,y)
cor(x,y) #korelacija

x<-rnorm(100, 5,1)
y<-(-2)*x + rnorm(100, 0, 1)
plot(x,y)
cor(x,y) 

x<-rnorm(100, 5,1)
y<-rnorm(100, 0, 1)
plot(x,y)
cor(x,y) 



