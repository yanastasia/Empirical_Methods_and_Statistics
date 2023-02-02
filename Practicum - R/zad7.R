card<-sample(c("bb", "ww", "bw"), 1)
card

#opredelja koja strana e gorna
side<-sample(c(1,2), 1)
side

#vzima podstring; od koja do koja bukva start i stop
up<-substr(card, start = side, stop = side)
c(up, card)

sim.bw<-function(){
	card<-sample(c("bb", "ww", "bw"), 1)
	side<-sample(c(1,2), 1)
	up<-substr(card, start = side, stop = side)
	c(up, card)
}
sim.bw()

rs<-replicate(1000, sim.bw())
sum(rs[2,]=="ww")/sum(rs[1,]=="w")



