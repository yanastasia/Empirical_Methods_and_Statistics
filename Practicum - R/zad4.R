#vseki 2 vprosa mozhe da se padnat
q<-c(rep(1,3), rep(2,17))
#oznachvame s 1 koito gi znae, s 2 koito ne gi znae
q

#izbira 2 vprosa bez vrshtane
x<-sample(q, 2, replace = FALSE)
x

#da ima 1 i 2 v x vektora; 1 da znae 1 ne
sum(x) == 3

sim.exams<-function(){
	q<-c(rep(1,3), rep(2,17))
	x<-sample(q, 2, replace = FALSE)
	sum(x) == 3
}

sim.exams()

prob.exams <- function(Nrep){
	rs <- replicate(Nrep, sim.exams())
	sum(rs)/length(rs)
}

prob.exams(100000)


