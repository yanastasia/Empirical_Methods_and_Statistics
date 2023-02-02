x2<-rexp(500, 1/7)
hist(x2, probability = T)
curve(dexp(x, 1.7), from = 0, to = max(x2), add = T, lwd = 2)

x2<-rexp(5000, 1/7)
hist(x2, probability = T)
curve(dexp(x, 1.7), from = 0, to = max(x2), add = T, lwd = 2)