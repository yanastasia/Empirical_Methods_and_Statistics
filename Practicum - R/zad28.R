x3 <- rnorm(500, 0, 1)
hist(x3, probability = T)
curve(dnorm(x,0,1), add = T, lwd = 2)

x3 <- rnorm(5000, 0, 1)
hist(x3, probability = T)
curve(dnorm(x,0,1), add = T, lwd = 2)