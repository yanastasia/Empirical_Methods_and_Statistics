z1.ci<-function(x.bar, sigma, n, alpha){
  b1<-x.bar-qnorm(1-alpja/2)*(sigma/sqrt(n))
  b1<-x.bar+qnorm(1-alpja/2)*(sigma/sqrt(n))
  c(b1,b2)
}

z1.ci(x.bar=61.9, sigma=4.1, n=66, alpha=0.05)
z1.ci(x.bar=61.9, sigma=4.1, n=88, alpha=0.05)
