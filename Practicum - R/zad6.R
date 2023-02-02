#vrh kojto e izbrala vsjaka mravka
a<-vector("numeric", length = 3)
a[1]<-sample(c(2,3), 1)
a[2]<-sample(c(1,3), 1)
a[3]<-sample(c(1,2), 1)
a

c(1,2,3) %in% a

#trsime navsjakade da imame true

all(c(1,2,3) %in% a)

#sredi kod
sim.ants<-fuction(){
	a<-vector("numeric", length = 3)
	a[1]<-sample(c(2,3), 1)
	a[2]<-sample(c(1,3), 1)
	a[3]<-sample(c(1,2), 1)
	
	all(c(1,2,3)%in%a)
}

sim.ants()

prob.ants<-function(Nrep){
	rs<-replicate(Nrep, sim.ants())
	sum(rs)/length(rs)
}

prob.ants(100000)