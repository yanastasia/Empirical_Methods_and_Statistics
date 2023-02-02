#kljuchovete sa sluchajno rasporedeni
#trjabva da generirame permuntacija i da vidim dali na 5toto mjasto e bernija kljuch

x<-sample(c(1:5), 5, replace = FALSE)
x

# pravilen kljuch e oznachen s 1
x[5] == 1

sim.keys<-function(){
	x<-sample(c(1:5), 5, replace = FALSE)
	x[5]==1
}

sim.keys()

prob.keys<-function(Nrep){
	rs<-replicate(Nrep, sim.keys())
	sum(rs)/length(rs)
}

prob.keys(100000)