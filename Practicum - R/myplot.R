
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

