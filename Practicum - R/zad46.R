x<-runif(500, 3, 7)
x<-rexp(500, 1/5)
x<-rnorm(500, 5, 1)

#boxplot(x, horizontal=T)

i1<-min(mean(x)-3*sd(x), min(x))
i2<-max(mean(x)+3*sd(x), max(x))

boxplot(x, ylim=c(i1,i2), horizontal=T)

points(mean(x), 1, pch=18, col="darkorange1", cex=1.7)
points(mean(x)-3*sd(x), 1, pch="[", col="darkorange1", cex=1.5)
points(mean(x)+3*sd(x), 1, pch="]", col="darkorange1", cex=1.5)