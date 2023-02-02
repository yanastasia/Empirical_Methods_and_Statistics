#1
d<-c(8, 3, 8, 7, 15, 9, 12, 4, 9, 10, 5, 1)
m<-matrix(data=d, nrow=5, ncol=2) #turning data from d into a 5x2 matrix

row.names(m)<-c("r1","r2","r3","r4","r5") #adding row names
m<-cbind(m, c(1, 3, 5, 7, 9)) #adding a column of c(1, 3, 5, 7, 9)

m[order(m[,1]),] #order by first column

#2
install.packages("UsingR")
library(UsingR)
head(homedata)

homedata1970<-homedata$y1970 #create vector of homeprices in 1970
head(homedata1970)
homedata2000<-homedata$y2000 #create vector of homeprices in 2000
head(homedata2000)

minPrice<-min(homedata2000)
maxPrice<-max(homedata2000)

homedata1970[which(homedata2000==minPrice)]
homedata1970[which(homedata2000==maxPrice)]

tail(sort(homedata2000), 5)

sum(homedata2000>750000)

mostExpensive<-homedata2000[homedata2000>750000]
mostExpensive

mean(mostExpensive)
homedata2000[which(homedata2000<homedata1970)]

x<-(homedata2000-homedata1970)/homedata1970*100
head(sort(x, decreasing=TRUE),10)

sum(homedata1970==0)

#3
install.packages("MASS")
library(MASS)
head(survey)
summary(survey)

sum(survey$Sex=="Male", na.rm=TRUE) #number of males

sum(survey$Sex=="Male"&survey$Smoke!="Never", na.rm=TRUE) #number of male smokers
mean(survey[survey$Sex=="Male", "Height"], na.rm=TRUE) #mean of male height

survey[order(survey$Age)[1:6], c("Height", "Sex")]
