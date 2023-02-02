data("airquality")
temp<-airquality$Temp
mean(temp)
median(temp)
sd(temp)

mean(temp) - 3*sd(temp)
mean(temp) + 3*sd(temp)

summary(temp)

boxplot(temp, horizontal=T)

#################################

ozone <- airquality$Ozone
median(ozone, na.rm=T)
mean(ozone, na.rm=T)
sd(ozone, na.rm=T)

summary(ozone)
mean(ozone, na.rm=T) - 3*sd(ozone, na.rm=T)
mean(ozone, na.rm=T) + 3*sd(ozone, na.rm=T)

quantile(ozone, 0.25, names=F, na.rm=T) - 1.5*IQR(ozone, na.rm=T)
quantile(ozone, 0.75, names=F, na.rm=T) + 1.5*IQR(ozone, na.rm=T)

