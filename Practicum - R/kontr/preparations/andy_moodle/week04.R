#zad 1 
dice<-sample(x<-1:6, size = 30, replace = TRUE);
dice

x<-rbinom(1000, 30, 1/6) #Bi(30, 1/6)
sum(x<=4)/length(x) #po-malko ot 5 shestici

pbinom(q=4, size=30, prob = 1/6) #po-malko ot 5 shestici P(X<5)=P(X<=4)

numSixes<-rbinom(n=1000, size=30, prob = 1/6)
plot(cumsum(numSixes<5)/(1:5000),
     type = "l", 
     col = "blue")
expected<-pbinom(4, size = 30, prob = 1/6)
expected
lines(rep(expected, 1000), col = "red")

#zad2
#X e NB(n=3, p = 0.2)

#P(8-3) = P(X=5) = P(X<=5)-P(X<=4)
dnbinom(8-3, size = 3, prob = 0.2)
pnbinom(5, size = 3, prob = 0.2)-pnbinom(4, size = 3, prob = 0.2)

#P(X>6-3) = P(X>3)
pnbinom(6-3, size = 3, prob = 0.2, lower.tail = FALSE)

#P(5-3<=X<=8-3) = P(2<=X<=5) = P(X<=5)-P(X<=1)
pnbinom(5, size = 3, prob = 0.2)-pnbinom(1, size = 3, prob = 0.2)

#zad3
#bez vrshtane=>nezavisimi opiti
#X e broj istegleni beli topki ~ HG(m = 7, n = 6, k = 8)
#m - broj beli topki v urna
#n - broj cherni topki v urna
#k - broj topki iztegleni

m = 7
n = 6
k = 8
x<-rhyper(1000, m, n, k)
x
range(x) #granici
mean(x) #ochakvane
var(x) #disperzija

hist(x, probability = TRUE) #y osta = verojatnost
points(0:7, dhyper(0:7, m, n, k), type = "h", lwd = 3, col = "darkblue") #type = "h" - line to point
points(0:7, dhyper(0:7, m, n, k), type = "p", lwd = 3, col = "darkblue") #type = "p" - point

#zad 4

#X~Bi(n, 5/2n)
#P(X=2)
n<-c(10, 100, 1000, 10000)
dbinom(2, n, 5/(2*n))

#zad 5 
#zad4 samo teglat razlichni chisla
#X~HG(5, 2n-5, n)
#P(X=2)

dhyper(2, 5, 2*n-5, n)

#zad6
