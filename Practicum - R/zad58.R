z1.ci<-function(x.bar, sigma, n, alpha){
  b1<-x.bar-qnorm(1-alpja/2)*(sigma/sqrt(n))
  b1<-x.bar+qnorm(1-alpja/2)*(sigma/sqrt(n))
  c(b1,b2)
}