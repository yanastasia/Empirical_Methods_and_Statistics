#generirame vektor
x<-sample(c(1:365), 25, replace = TRUE)
x

#proverjavame dali ima povtarjashti se elementi

anyDuplicated(x)
#vrshta 0 ako njama povtarjashti se
#ako >0 vrshta indeks na vtor occurence na element

anyDuplicated(x)>0
#TRUE ako ima povtarjashti se

sim.bday<-function(k){
	x<-sample(c(1:365), k, replace = TRUE)
	anyDuplicated(x)>0
}

sim.bday(25)

rs<-replicate(100000, sim.bday(25))
sum(rs)/length(rs)

prob.bday<-function(Nrep, k){
	rs<-replicate(Nrep, sim.bday(k))
	sum(rs)/length(rs)
}

prob.bday(100000, 25)
