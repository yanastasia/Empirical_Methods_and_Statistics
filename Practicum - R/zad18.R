#x = брой грешки на 1500 думи 
#x ~ Bi(n=1500, p=1/500)

n<- 1500
p<-1/500

#P(x<=2)
pbinom(2, n, p)
ppois(2, n*p)


#P(1<=x<=3)
dbinom(1, n, p) + dbinom(2, n, p) + dbinom(3, n, p)
# ^
#||
# ^
sum(dbinom(c(1:3), n, p))

#P(1<=x<=30) = P(x<=3) - P(x<=0)
pbinom(3, n, p) - pbinom(0, n, p)
ppois(3, n*p) - ppois(0, n*p)