#z26

x1<-runif(500, 2, 3)
x1[1:50]
#hist(x1)
#ocenka na plurnosta po generirani danni
hist(x1, probability = T) #skala po y, suma ot licata na pravougulnicite e 1ca
curve(dunif(x, 2, 3), from = 2, to = 3, add = T)
curve(dunif(x, 2, 3), from = 2, to = 3, add = T, lwd = 2) #zadebelqne na liniqta

x1<-runif(5000, 2, 3)
hist(x1, probability = T)
curve(dunif(x, 2, 3), from = 2, to = 3, add = T)