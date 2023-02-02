sim.exp.med<-function(n, lamda){
  x<-rexp(n,lamda)
  est1<-mean(x)*log(2)
  est2<-median(x)
  c(est1,est2)
}

rs1<-replicate(30000, sim.exp.med(n=20, lamda=1/5)) #sredna ocenka na es1 i est za n=20
rs2<-replicate(30000, sim.exp.med(n=50, lamda=1/5))
rs3<-replicate(30000, sim.exp.med(n=100, lamda=1/5))
rs4<-replicate(30000, sim.exp.med(n=500, lamda=1/5))
rs5<-replicate(30000, sim.exp.med(n=1000, lamda=1/5))

rs<-rbind(rs1, rs2, rs3, rs4, rs5)

rs.mean<-apply(rs, 1, mean)
rs.sd<-apply(rs, 1, sd)

true.val<-5*log(2)

myplot1 <- function(rs.mean, rs.sd, true.val) {
  i1 <- min(rs.mean) - max(rs.sd)
  i2 <- max(rs.mean) + max(rs.sd)
  
  plot( 1, xlim=c(0,11), ylim=c(i1,i2), pch="", 
        xlab="", ylab="",  xaxt="n" )
  abline( h=true.val, col="red", lwd=1.4 )
  arrows( c(1:10), rs.mean-rs.sd, c(1:10), rs.mean+rs.sd, 
          code=3, angle=90, 
          length=0.05, lwd=1.4, col=c("gray55", "blue3") )
  points( c(1:10), rs.mean, pch=20, type="p", 
          col=c("gray55", "blue3") )
  axis( side=1, at=seq(1.5, 9.5, 2), 
        labels=c(20, 50, 100, 500, 1000), tick=FALSE )
}

myplot1(rs.mean, rs.sd, true.val)