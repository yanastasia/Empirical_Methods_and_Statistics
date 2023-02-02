#1 2 3 ... 20

#permuntacija na chislo od 1 do 20
#vektor ot koj izbirame, kolko elementi, dali ima povtorenie 
#generirane permuntacija

x <-sample(c(1:20), 20, replace = FALSE) 
x

d<-x - c(1:20)
d
#dali pone edin element ot d e 0
any(d==0)

sim.gifts <- function(k){
	x <- sample(c(1:k), k, replace = FALSE)
	d <- x-c(1:k)
	any(d==0)
}

sim.gifts(20)

#povtarjane na funkcija i rezultata se zapisva v vektor
rs <- replicate( 100000, sim.gifts(20))

#kolko pti imame true v vektora
#sum(rs)==sum(rs==TRUE)
sum(rs)/length(rs)

prob.gifts <- function(Nrep, k){
	rs <- replicate(Nrep, sim.gifts(k))
	sum(rs)/length(rs)
}

prob.gifts(100000, 20)