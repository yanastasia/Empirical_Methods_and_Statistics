e03sum<-replicate(10000, sum(rexp(3, 1/5)))
e07sum<-replicate(10000, sum(rexp(7, 1/5)))
e10sum<-replicate(10000, sum(rexp(10, 1/5)))
e30sum<-replicate(10000, sum(rexp(30, 1/5)))
e90sum<-replicate(10000, sum(rexp(90, 1/5)))
e200sum<-replicate(10000, sum(rexp(200, 1/5)))

hist(e03sum, prob=T)
hist(e07sum, prob=T)
hist(e10sum, prob=T)
hist(e30sum, prob=T)
hist(e90sum, prob=T)
hist(e200sum, prob=T)



