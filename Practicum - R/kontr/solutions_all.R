# Математически функции

(5+7)/(4-1)

9^2

sqrt(25)

log(exp(1))

28 %% 10

27/1000000

5000*5000

options(scipen=999)
27/1000000

options(scipen=0)
27/1000000



# Вектори

x <- c(5, 12, 11, 14, 2, 3, 14, 10, 3)
x

x[3]

x[1:5]

x[c(2,5,9)]

ind <- c(2,5,9)
x[ind]

x[9:1]

x[-4]

x[-c(2,3)]

x[x>10]

length(x)

min(x)

max(x)

head(x, 3)

tail(x, 3)

x>10

sum(x>10)

which(x>10)

diff(x)

cumsum(x)

sum(x)

x^2

exp(x)

sort(x)

x[ order(x) ]

sort(x, decreasing=TRUE)

x[ order(x, decreasing=TRUE) ]

rm(x) 
x

x <- c(1,3,5,11,15)
class(x)

x <- as.integer(c(1,3,5,11,15))
class(x)

y <- c("Y", "Y", "N")
class(y)

z <- c(TRUE, TRUE, FALSE)
class(z)

x <- vector("logical", length=5)
x

y <- vector("numeric", length=5)
y

z <- vector("character", length=5)
z

x <- c(5,5,5,7,7,7)
y <- c(2,2,1)
x+y

y <- c(2,2,1,1)
x+y



# Генериране на редици

rep( 5, times=8 )

rep( c(1,2), times=5 )

rep( c(1,2), each=5 )

rep( c(1,2), length.out=7 )


rep( c("a","b"), times=5 )

rep( c("a","b"), each=3 )


5:12

10:1

seq( from=1, to=10, by=2 )

seq( from=10, to=1, by=-2 )

seq( from=0, to=1, by=0.2 )

seq( from=0, to=1, length.out=11 )


  
# Матрици

M <- rbind( c(5,3,5,6), c(8,3,7,4) )
M

M[2, 3]

M[ ,3]

M[2, ]

M <- cbind( c(5,3,5,6), c(8,3,7,4) )
M

t(M)

M[ c(3,1), ]

M[ order( M[,1] ), ]

M[ order( M[,1], M[,2] ), ]

M <- matrix( 0, nrow=3, ncol=4 )
M

M <- matrix( c(1:12), nrow=3, ncol=4 )
M

M <- matrix( c(1:12), nrow=3, ncol=4, byrow=TRUE )
M

head(M, 2)

tail(M, 2)

sqrt(M)

rownames(M) <- c("a", "b", "c")
colnames(M) <- c("X1", "X2", "X3", "X4")
M

M[ ,"X3"]

M["b", ]



# Data frame

x <- c(5, 8, 11, 3, 2, 9, 4)
y <- c("Y", "Y", "N", "Y", "N", "N", "Y")
df <- data.frame(x,y)
df

str(df)

df$x

df$y

df$x[4]

df[ ,1]

df[5, ]

df[ ,"x"]

df$z <- seq(from=1, to=14, by=2)
df
str(df)

df[ 3, c("x","z") ]

df[ c(5,7), c(2,3) ]

df$x[ df$z <= 5 ]

df$x[ df$y == "N" ]

df[ df$z <= 5, c("x","z") ]



# Полезни функции

# getwd()
# setwd(dir)
# save(...)
# save.image(...)
# read.table(file)
# write.table(x, file)
# replace(x, list, values)
# ifelse(test, yes, no)
# any(...)
# all(...)
# unique(...)
# duplicated(...)
# is.element(x, y) 
# x %in% y
# tabulate(...)
# substr(x, start, stop)


###
# zad1
# dice

Nrep <- 20000
dice <- sample( c(1:6), Nrep, replace=T )
sum(dice==6)/Nrep


###
# zad2
# gifts

sim.gifts <- function(k) {
  x <- sample( c(1:k), k, replace=F )
  d <- x - c(1:k)
  any(d==0)
}

prob.gifts <- function(Nrep, k) {
  rs <- replicate( Nrep, sim.gifts(k) )
  sum(rs)/length(rs)
}

prob.gifts(100000, 20)

# for large k 
1-1/exp(1)


###
# zad3
# birthdays

sim.bday <- function(k) {
  x <- sample( c(1:365), k, replace=T )
  anyDuplicated(x) > 0
}

prob.bday <- function(Nrep, k) {
  rs <- replicate( Nrep, sim.bday(k) )
  sum(rs)/length(rs)
}

prob.bday(100000, 25)

# other solutions
prob.bday1 = function(Nrep, k) {
  M <- replicate( Nrep, sample( c(1:365), k, replace=T ) )
  v <- apply( M, 2, anyDuplicated )
  sum(v>0)/length(v) 
}

prob.bday2 = function(Nrep, k) {
  M <- replicate( Nrep, sample( c(1:365), k, replace=T ) )
  v <- apply( M, 2, function(x) max(tabulate(x)) )
  sum(v>=2)/length(v) 
} 

prob.bday1(100000, 25)
prob.bday2(100000, 25)


###
# zad4
# exam 20 questions

sim.exam <- function() {
  q <- c( rep(1,3), rep(2,17) )
  x <- sample( q, 2, replace=F )
  sum(x)==3
}

prob.exam <- function(Nrep) {
  rs <- replicate( Nrep, sim.exam() )
  sum(rs)/length(rs)
}

prob.exam(100000)


###
# zad5
# 5 keys

sim.keys <- function() {
  x <- sample( c(1:5), 5, replace=F )
  x[5]==1
}

prob.keys <- function(Nrep) {
  rs <- replicate( Nrep, sim.keys() )
  sum(rs)/length(rs)
}

prob.keys(100000)


### 
# zad6
# three ants

sim.ants <- function() {
  a <- vector("numeric", 3)
  a[1] <- sample( c(2,3), 1 )
  a[2] <- sample( c(1,3), 1 )
  a[3] <- sample( c(1,2), 1 ) 
  all( c(1,2,3) %in% a ) 
}

prob.ants <- function(Nrep) {
  rs <- replicate( Nrep, sim.ants() )
  sum(rs)/length(rs)
}

prob.ants(100000)


###
# zad7
# cards in boxes

sim.bw <- function() { 
  card <- sample( c("bb", "ww", "bw"), 1 )
  side <- sample( c(1,2), 1 )
  up <- substr( card, start=side, stop=side ) 
  c(up, card)
}

prob.bw <- function(Nrep) {
  rs <- replicate( Nrep, sim.bw() )
  sum(rs[2,]=="ww") / sum(rs[1,]=="w") 
}

sim.bw()
prob.bw(100000)


###
# zad8

sim.balls <- function() {
  x <- sample( c(1:5), 2, replace=T )
  x[1]==x[2]
}

prob.balls <- function(Nrep) {
  rs <- replicate( Nrep, sim.balls() )
  sum(rs)/length(rs)
}  

prob.balls(100000)


###
# zad9

sim.socks <- function() {
  x <- sample( c(1,1,2,2,3,3), 2, replace=F )
  x[1]==x[2]
}

prob.socks <- function(Nrep) {
  rs <- replicate( Nrep, sim.socks() )
  sum(rs)/length(rs)
}

prob.socks(100000)


###
# zad14 
# X = брой шестици при 10 хвърляния на зар
# X ~ Bi(n=10, p=1/6)

n <- 10
p <- 1/6

# P(X=2)
dbinom(2, n, p)

# P(X<=2)
pbinom(2, n, p)

# P(X>=2) = 1 - P(X<=1)
1 - pbinom(1, n, p)


###
# zad15
# X = брой хвърляния до първа шестица (вкл.)
# X ~ Ge(p=1/6)

p <- 1/6

# P(X<=10)
pgeom(10-1, p)

# P(X>=6) = 1 - P(X<=5)
1 - pgeom(5-1, p)


###
# zad16
# X = брой хвърляния докато се паднат 3 шестици (вкл.)
# X ~ NB(r=3, p=1/6)

r <- 3
p <- 1/6

# P(X<=20)
pnbinom(20-r, r, p)


###
# zad17
# X = брой нови батерии от избраните

# P(X=2)
dhyper(2, 5, 3, 2)


###
# zad18
# X = брой грешки на 1500 думи
# X ~ Bi(n=1500, p=1/500)

n <- 1500
p <- 1/500

# P(X<=2)
pbinom(2, n, p)
ppois(2, n*p)

# P(1<=X<=3) = P(X=1) + P(X=2) + P(X=3)
dbinom(1, n, p) + dbinom(2, n, p) + dbinom(3, n, p)
sum( dbinom( c(1:3), n, p ) )
# P(1<=X<=3) = P(X<=3) - P(X<=0)
pbinom(3, n, p) - pbinom(0, n, p)
ppois(3, n*p) - ppois(0, n*p)


###
# zad19
# X = брой верни отговори на теста
# X ~ Bi(n=10, p=1/4)

n <- 10
p <- 1/4

# P(X>=5) = 1 - P(X<=4)
1 - pbinom(4, n, p)


###
# zad20
# въпрос 1
# X = брой тествани до намиране на първия доброволец с дадения ген (вкл.)
# X ~ Ge(p=0.1)

p <- 0.1

# P(X>=5) = 1 - P(X<=4)
1 - pgeom(4-1, p)

# въпрос 2
# X = брой тествани до намиране на 10 доброволци с дадения ген (вкл.)
# X ~ NB(r=10, p=0.1)

r <- 10
p <- 0.1

# P(X>=50) = 1 - P(X<=49)
1 - pnbinom(49-r, r, p)


###
# zad26
par(mfrow=c(1,2))

x1 <- runif(500, 2, 3)
hist(x1, probability=T)
curve( dunif(x, 2, 3), from=2, to=3, add=T, lwd=2 )

x1 <- runif(5000, 2, 3)
hist(x1, probability=T)
curve( dunif(x, 2, 3), from=2, to=3, add=T, lwd=2 )


###
# zad27
par(mfrow=c(1,2))

x2 <- rexp(500, 1/7)
hist(x2, probability=T)
curve( dexp(x, 1/7), from=0, to=max(x2), add=T, lwd=2 )

x2 <- rexp(5000, 1/7)
hist(x2, probability=T)
curve( dexp(x, 1/7), from=0, to=max(x2), add=T, lwd=2 )


###
# zad28
par(mfrow=c(1,2))

x3 <- rnorm(500, 0, 1)
hist(x3, probability=T)
curve( dnorm(x, 0, 1), add=T, lwd=2 )

x3 <- rnorm(5000, 0, 1)
hist(x3, probability=T)
curve( dnorm(x, 0, 1), add=T, lwd=2 )


###
# zad29
# X = количество душ гел в опаковка
# X ~ U(248, 255)

# P(X<250) = P(X<=250)
punif(250, 248, 255)

# v=? P(X=>v) = 0.95
# P(X<v) = 0.05
qunif(0.05, 248, 255)

punif(248.35, 248, 255)


###
# zad30
# X = време на живот на лазерен диод
# X ~ Exp(1/10)

# P(X>10) = 1 - P(X<=10)
1 - pexp(10, 1/10)

# P(7 < X < 11) = P(X<11) - P(X<7)
pexp(11, 1/10) - pexp(7, 1/10)

# t=? P(X=>t) = 0.97
# P(X<t) = 0.03
qexp(0.03, 1/10)

pexp(0.3045921, 1/10)


###
# zad31
# X = време от зареждане до изтощаване на батерия
# X ~ N(mu=260, sigma=50)

# P(X>240) = 1 - P(X<=240)
1 - pnorm(240, 260, 50)

# P(180 < X < 300) = P(X<300) - P(X<180)
pnorm(300, 260, 50) - pnorm(180, 260, 50)

# t=? P(X>t) = 0.9
# P(X<=t) = 0.1
qnorm(0.1, 260, 50)


###
# zad32
# X = изразходвано количество кашкавал за седмица
# X ~ N(mu=41, sigma=5)

# P(X>51) = 1 - P(X<=51)
1 - pnorm(51, 41, 5)

# t=? P(X<=t) = 0.99
qnorm(0.99, 41, 5)


###
# zad33
# X = количество бира, изпита от Иван за една седмица
# X ~ Exp(1/3)

# P(X>10) = 1 - P(X<=10)
p1 <- 1 - pexp(10, 1/3)

# Y = брой седмици (от следв. 5) в които Иван изпива повече от 10 литра
# Y ~ Bi(n=5, p=p1)

# P(Y<=3)
pbinom(3, 5, p1)


###
library(MASS)
data(survey)
?survey

?is.na   # help
which( is.na(survey$Smoke) )
which( is.na(survey$Pulse) )

sum( survey$Smoke=="Never" )
sum( survey$Smoke=="Never", na.rm=T )


###
# zad36
table(survey$Exer)

attach(survey)
table(Exer)

sort( table(Exer), decreasing=T )
100*table(Exer)/length(Exer)
100*prop.table( table(Exer) )

barplot( table(Exer) )
barplot( sort( table(Exer), decreasing=T ) )
barplot( 100*table(Exer)/length(Exer) )
pie( table(Exer) )
pie( table(Exer), col=c("red", "yellow", "blue") )


###
# zad37
table(Smoke)
table(Smoke, useNA="ifany")
which( is.na(Smoke) )

sort( table(Smoke), decreasing=T )
100*table(Smoke)/length(Smoke)

barplot( table(Smoke) )
barplot( sort( table(Smoke), decreasing=T ) )
barplot( 100*table(Smoke)/length(Smoke) )
pie( table(Smoke) )


###
# zad38
# a
tb1 <- 100*table(Smoke)/length(Smoke)
tb1
tb1[2]
tb1["Never"]
# отг. 79.75

# b
table(Smoke, Exer)
table(Smoke, Exer)[2, 1]
table(Smoke, Exer)["Never", "Freq"]
# отг. 87

# v
tab.smoke.exer <- table(Smoke, Exer)
# Таблица, в която сумата на всички стойности е 100%:
100*prop.table( tab.smoke.exer )
100*prop.table( tab.smoke.exer )[2, 1]
100*prop.table( tab.smoke.exer )["Never", "Freq"]
# отг. 36.86

# g
# Таблица, в която сумата на всеки ред е 100%:
100*prop.table( tab.smoke.exer, margin=1 )
100*prop.table( tab.smoke.exer, margin=1 )[2, 1]
100*prop.table( tab.smoke.exer, margin=1 )["Never", "Freq"]
# отг. 46.03

# d
# Таблица, в която сумата на всяка колона е 100%:
100*prop.table( tab.smoke.exer, margin=2 )
100*prop.table( tab.smoke.exer, margin=2 )[2, 1]
100*prop.table( tab.smoke.exer, margin=2 )["Never", "Freq"]
# отг. 75.65


###
# zad39
barplot( table(Smoke, Exer) )

barplot( table(Smoke, Exer), legend=T )

barplot( table(Smoke, Exer), legend=T,
         args.legend=list(x="top") )

barplot( 100*prop.table( tab.smoke.exer, 2 ), 
         legend=T, xlim=c(0,5),
         args.legend=list(x="right") )


###
# zad40
barplot( table(Exer, Smoke), legend=T, 
         args.legend=list(x="topright") )

barplot( table(Exer, Smoke), legend=T, 
         beside=T,
         args.legend=list(x="topright") )

tab.exer.smoke <- table(Exer, Smoke)

barplot( 100*prop.table( tab.exer.smoke, 2 ), 
         legend=T, xlim=c(0,6),
         args.legend=list(x="right") )


###
# zad41
table(Pulse)
table(Pulse, useNA="ifany")

pulse.grp <- cut(Pulse, breaks=seq(30,110,10))
pulse.grp
table(pulse.grp)

barplot( table(pulse.grp) )
hist(Pulse)
hist(Pulse, breaks=seq(30,110,5))

stripchart(Pulse, method="stack", pch=20)
stripchart(Pulse, method="stack", pch=18)
stripchart(Pulse, method="stack", pch=1)


###
# zad42
table(Age)

age.grp <- cut(Age, breaks=seq(15,75,10))
table(age.grp)

barplot( table(age.grp) )
hist(Age)

stripchart(Age, method="stack", pch=20)


###
# scatter plot and correlation
x <- rnorm(100, 5, 1)
y <- 2*x
plot(x,y)
cor(x,y)

x <- rnorm(100, 5, 1)
y <- (-2)*x
plot(x,y)
cor(x,y)

x <- rnorm(100, 5, 1)
y <- 2*x + rnorm(100, 0, 1)
plot(x,y)
cor(x,y)

x <- rnorm(100, 5, 1)
y <- (-2)*x + rnorm(100, 0, 1)
plot(x,y)
cor(x,y)

x <- rnorm(100, 5, 1)
y <- rnorm(100, 5, 1)
plot(x,y)
cor(x,y)


###
library(MASS)
data(survey)
attach(survey)


###
# zad43
# a
median( Pulse, na.rm=T )
mean( Pulse, na.rm=T )
sd( Pulse, na.rm=T )

# b
median( Pulse[Sex=="Female"], na.rm=T )
mean( Pulse[Sex=="Female"], na.rm=T )
sd( Pulse[Sex=="Female"], na.rm=T )

# v
median( Pulse[Age<=25], na.rm=T )
mean( Pulse[Age<=25], na.rm=T )
sd( Pulse[Age<=25], na.rm=T )

# g
median( Pulse[Exer=="Freq"], na.rm=T )
mean( Pulse[Exer=="Freq"], na.rm=T )
sd( Pulse[Exer=="Freq"], na.rm=T )

# d
median( Pulse[Smoke=="Never" & Exer=="Freq"], na.rm=T )
mean( Pulse[Smoke=="Never" & Exer=="Freq"], na.rm=T )
sd( Pulse[Smoke=="Never" & Exer=="Freq"], na.rm=T )


###
# zad44
boxplot( Pulse ~ Exer )

boxplot( Pulse[Exer=="Freq"],
         Pulse[Exer=="None"],
         Pulse[Exer=="Some"] )

median( Pulse[Exer=="Freq"], na.rm=T )
median( Pulse[Exer=="None"], na.rm=T )
median( Pulse[Exer=="Some"], na.rm=T )

mean( Pulse[Exer=="Freq"], na.rm=T )
mean( Pulse[Exer=="None"], na.rm=T )
mean( Pulse[Exer=="Some"], na.rm=T )


###
# zad45
grades <- read.table("exam_grades.txt", header=T)
attach(grades)

# a
plot( test1, course.grade )
plot( test2, course.grade )
plot( test3, course.grade )

cor( test1, course.grade, use="complete.obs" )
cor( test2, course.grade, use="complete.obs" )
cor( test3, course.grade, use="complete.obs" ) 

# b
boxplot( course.grade ~ sex )

median( course.grade[sex=="Man"] )
median( course.grade[sex=="Woman"] )

mean( course.grade[sex=="Man"] )
mean( course.grade[sex=="Woman"] )

# v
boxplot( course.grade ~ semester )


###
# zad46
# a
x <- runif(500, 3, 7)

# b
x <- rexp(500, 1/5)

# v
x <- rnorm(500, 5, 1)

i1 <- min( mean(x)-3*sd(x), min(x) )
i2 <- max( mean(x)+3*sd(x), max(x) )
boxplot( x, ylim=c(i1,i2), horizontal=T )
points( mean(x), 1, pch=18, col="darkorange1", cex=1.7 )
points( mean(x)-3*sd(x), 1, pch="[", col="darkorange1", cex=1.5 )
points( mean(x)+3*sd(x), 1, pch="]", col="darkorange1", cex=1.5 )


###
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


###
# zad49
sim.norm.prob <- function(n, mu, sigma, a) {
  x <- rnorm(n, mu, sigma)
  est1 <- pnorm(a, mean(x), sd(x))
  est2 <- sum(x<=a)/n
  c(est1, est2)
}

# a = 3.4
rs1 <- replicate( 30000, sim.norm.prob(n=20, mu=5, sigma=1, a=3.4) )
rs2 <- replicate( 30000, sim.norm.prob(n=50, mu=5, sigma=1, a=3.4) )
rs3 <- replicate( 30000, sim.norm.prob(n=100, mu=5, sigma=1, a=3.4) )
rs4 <- replicate( 30000, sim.norm.prob(n=500, mu=5, sigma=1, a=3.4) )
rs5 <- replicate( 30000, sim.norm.prob(n=1000, mu=5, sigma=1, a=3.4) )

rs <- rbind( rs1, rs2, rs3, rs4, rs5 )

rs.mean <- apply(rs, 1, mean)
rs.sd <- apply(rs, 1, sd)
true.val <- pnorm(3.4, 5, 1)

myplot1(rs.mean, rs.sd, true.val)

# a = 4.5
rs1 <- replicate( 30000, sim.norm.prob(n=20, mu=5, sigma=1, a=4.5) )
rs2 <- replicate( 30000, sim.norm.prob(n=50, mu=5, sigma=1, a=4.5) )
rs3 <- replicate( 30000, sim.norm.prob(n=100, mu=5, sigma=1, a=4.5) )
rs4 <- replicate( 30000, sim.norm.prob(n=500, mu=5, sigma=1, a=4.5) )
rs5 <- replicate( 30000, sim.norm.prob(n=1000, mu=5, sigma=1, a=4.5) )

rs <- rbind( rs1, rs2, rs3, rs4, rs5 )

rs.mean <- apply(rs, 1, mean)
rs.sd <- apply(rs, 1, sd)
true.val <- pnorm(4.5, 5, 1)

myplot1(rs.mean, rs.sd, true.val)


###
# zad50
sim.unif.med <- function(n, b){
  x <- runif(n, 0, b)
  est1 <- max(x)/2
  est2 <- median(x)
  c(est1, est2)
}

rs1 <- replicate( 30000, sim.unif.med(n=20, b=8) )
rs2 <- replicate( 30000, sim.unif.med(n=50, b=8) )
rs3 <- replicate( 30000, sim.unif.med(n=100, b=8) )
rs4 <- replicate( 30000, sim.unif.med(n=500, b=8) )
rs5 <- replicate( 30000, sim.unif.med(n=1000, b=8) )

rs <- rbind( rs1, rs2, rs3, rs4, rs5 )

rs.mean <- apply(rs, 1, mean)
rs.sd <- apply(rs, 1, sd)
true.val <- 4

myplot1(rs.mean, rs.sd, true.val)


###
# zad51
sim.exp.med <- function(n, lambda) {
  x <- rexp(n, lambda)
  est1 <- mean(x)*log(2)
  est2 <- median(x)
  c(est1, est2)
}

rs1 <- replicate( 30000, sim.exp.med(n=20, lambda=1/5) )
rs2 <- replicate( 30000, sim.exp.med(n=50, lambda=1/5) )
rs3 <- replicate( 30000, sim.exp.med(n=100, lambda=1/5) )
rs4 <- replicate( 30000, sim.exp.med(n=500, lambda=1/5) )
rs5 <- replicate( 30000, sim.exp.med(n=1000, lambda=1/5) )

rs <- rbind( rs1, rs2, rs3, rs4, rs5 )

rs.mean <- apply(rs, 1, mean)
rs.sd <- apply(rs, 1, sd)
true.val <- 5*log(2)

myplot1(rs.mean, rs.sd, true.val)


###
# zad52
sim.norm.sd <- function(n, mu, sigma) {
  x <- rnorm(n, mu, sigma)
  x.bar <- mean(x)
  est1 <- sqrt( sum((x - x.bar)^2)/n )
  est2 <- sqrt( sum((x - x.bar)^2)/(n-1) )
  c(est1, est2)
}

rs1 <- replicate( 30000, sim.norm.sd(n=20, mu=3, sigma=2) )
rs2 <- replicate( 30000, sim.norm.sd(n=50, mu=3, sigma=2) )
rs3 <- replicate( 30000, sim.norm.sd(n=100, mu=3, sigma=2) )
rs4 <- replicate( 30000, sim.norm.sd(n=500, mu=3, sigma=2) )
rs5 <- replicate( 30000, sim.norm.sd(n=1000, mu=3, sigma=2) )

rs <- rbind( rs1, rs2, rs3, rs4, rs5 )

rs.mean <- apply(rs, 1, mean)
rs.sd <- apply(rs, 1, sd)
true.val <- 2

myplot1(rs.mean, rs.sd, true.val)

# 52 b
rs.mean2 <- apply(rs^2, 1, mean)
rs.sd2 <- apply(rs^2, 1, sd)
true.val2 <- 4

myplot1(rs.mean2, rs.sd2, true.val2)

# (!)  rs.mean2  е различно от  (rs.mean)^2


###
# zad56
e03sum <- replicate( 10000, sum( rexp(3, 1/5) ) )
e07sum <- replicate( 10000, sum( rexp(7, 1/5) ) )
e10sum <- replicate( 10000, sum( rexp(10, 1/5) ) )
e30sum <- replicate( 10000, sum( rexp(30, 1/5) ) )
e90sum <- replicate( 10000, sum( rexp(90, 1/5) ) )
e200sum <- replicate( 10000, sum( rexp(200, 1/5) ) )

hist(e03sum, prob=T)
hist(e07sum, prob=T)
hist(e10sum, prob=T)
hist(e30sum, prob=T)
hist(e90sum, prob=T)
hist(e200sum, prob=T)


###
# zad57
e03mean <- replicate( 10000, mean( rexp(3, 1/5) ) )
e07mean <- replicate( 10000, mean( rexp(7, 1/5) ) )
e10mean <- replicate( 10000, mean( rexp(10, 1/5) ) )
e30mean <- replicate( 10000, mean( rexp(30, 1/5) ) )
e90mean <- replicate( 10000, mean( rexp(90, 1/5) ) )
e200mean <- replicate( 10000, mean( rexp(200, 1/5) ) )

hist(e03mean, prob=T)
hist(e07mean, prob=T)
hist(e10mean, prob=T)
hist(e30mean, prob=T)
hist(e90mean, prob=T)
hist(e200mean, prob=T)
curve( dnorm(x, 5, 5/sqrt(200)), add=T, lwd=2 )


###
# zad58
u03mean <- replicate( 10000, mean( runif(3, 2, 8) ) )
u07mean <- replicate( 10000, mean( runif(7, 2, 8) ) )
u10mean <- replicate( 10000, mean( runif(10, 2, 8) ) )
u30mean <- replicate( 10000, mean( runif(30, 2, 8) ) )
u90mean <- replicate( 10000, mean( runif(90, 2, 8) ) )
u200mean <- replicate( 10000, mean( runif(200, 2, 8) ) )

hist(u03mean, prob=T)
hist(u07mean, prob=T)
hist(u10mean, prob=T)
hist(u30mean, prob=T)
hist(u90mean, prob=T)
hist(u200mean, prob=T)


###
# zad59
z1.ci <- function(x.bar, sigma, n, alpha) {
  b1 <- x.bar - qnorm(1-alpha/2)*(sigma/sqrt(n))
  b2 <- x.bar + qnorm(1-alpha/2)*(sigma/sqrt(n))
  c(b1, b2)
}

z1.ci( x.bar=61.9, sigma=4.1, n=66, alpha=0.05 )

z1.ci( x.bar=61.9, sigma=4.1, n=88, alpha=0.05 )


###
# t distribution
curve( dt(x, df=10), from=-5, to=5, lwd=1.8, col="orange" )
curve( dnorm(x,0,1), add=T, lwd=1.8, lty="dashed", col="blue" )

curve( dt(x, df=30), from=-5, to=5, lwd=1.8, col="orange" )
curve( dnorm(x,0,1), add=T, lwd=1.8, lty="dashed", col="blue" )

curve( dt(x, df=90), from=-5, to=5, lwd=1.8, col="orange" )
curve( dnorm(x,0,1), add=T, lwd=1.8, lty="dashed", col="blue" )


###
# zad60
t1.ci <- function(x.bar, s, n, alpha) {
  b1 <- x.bar - qt(1-alpha/2, df=n-1)*(s/sqrt(n))
  b2 <- x.bar + qt(1-alpha/2, df=n-1)*(s/sqrt(n))
  c(b1, b2)
}

x <- c(3.1, 3.0, 3.7, 2.6, 4.2, 3.8, 3.6, 2.7, 3.8, 4.4)

t1.ci( x.bar=mean(x), s=sd(x), n=length(x), alpha=0.05 )

t1.ci( x.bar=mean(x), s=sd(x), n=length(x), alpha=0.1 )

t.test( x, conf.level=0.95 )$conf.int[1:2]

t.test( x, conf.level=0.90 )$conf.int[1:2]


###
# zad61
prop1.ci <- function(x, n, alpha) {
  p.hat <- x/n
  b1 <- p.hat - qnorm(1-alpha/2)*sqrt(p.hat*(1-p.hat)/n)
  b2 <- p.hat + qnorm(1-alpha/2)*sqrt(p.hat*(1-p.hat)/n)
  c(b1, b2)
}

prop1.ci( x=22, n=38, alpha=0.05 )

prop.test( x=22, n=38, conf.level=0.95, correct=F )$conf.int[1:2]


###
# zad62
med1.ci <- function(x, alpha=0.05, nboot=1000) {
  x <- x[is.finite(x)]
  nx <- length(x)
  est1 <- median(x)
  med1.bt <- replicate( nboot, median( sample( x, size=nx, replace=TRUE ) ) )
  ci <- quantile( med1.bt, probs=c(alpha/2, 1-alpha/2), names=FALSE )
  list( est.med1=est1, ci=ci )
}

salk <- read.table("salk.txt")

med1.ci( salk[,1], alpha=0.05, nboot=10000 )
med1.ci( salk[,2], alpha=0.05, nboot=10000 )


###
# zad64
# mu = средна дължина на дясното ухо на жените (18-30 години)
# H0: mu = 60
# H1: mu != 60

x.bar <- 61.9
sigma <- 4.1
n <- 66
mu <- 60
z.obs <- (x.bar-mu)/(sigma/sqrt(n))
z.obs
p.value <- 2*(1-pnorm(abs(z.obs)))
p.value

# p.value = 0.000167 < 0.05 
# => отхвърляме нулевата хипотеза в полза на алтернативната.
# Имаме основание да твърдим, че средната дължина на дясното ухо 
# на жените на възраст между 18 и 30 години е различна от 60 мм.


###
# zad65
# mu = средна концентрация на кадмий в горските гъбите
# H0: mu = 4
# H1: mu < 4

x <- c(3.1, 3.0, 3.7, 2.6, 4.2, 3.8, 3.6, 2.7, 3.8, 4.4)
mu <- 4
n <- length(x)
t.obs <- (mean(x)-mu)/(sd(x)/sqrt(n))
t.obs
p.value <- pt(t.obs, n-1)
p.value

t.test( x, mu=4, alternative="less" )

# p.value = 0.0137 < 0.05
# => отхвърляме нулевата хипотеза в полза на алтернативната.
# Имаме основание да твърдим, че средната концентрация на кадмий
# в горските гъбите в дадената местност е по-малко от 4 мг/кг.


###
# zad66
# p = вероятност гълъб от дадения вид да намери пътя към дома си
# H0: p = 0.51
# H1: p > 0.51

x <- 22
n <- 38 
p <- 0.51
z.obs <- (x/n - p)/sqrt(p*(1-p)/n)
z.obs
p.value <- 1-pnorm(z.obs)
p.value

prop.test( x=22, n=38, p=0.51, alternative="greater", correct=F )

# p.value = 0.1976 > 0.05
# => нямаме основание да отвърлим нулевата хипотеза.
# Данните не подкрепят твърдението, че вероятността гълъб от 
# дадения вид да намери пътя към дома си е над 51%.


###
# zad67 a
# p = вероятност стока в хипермаркета да е с грешна цена
# H0: p = 0.075
# H1: p != 0.075

x <- 14
n <- 200
p <- 0.075
z.obs <- (x/n - p)/sqrt(p*(1-p)/n)
z.obs
p.value <- 2*(1-pnorm(abs(z.obs)))
p.value

prop.test( x=14, n=200, p=0.075, correct=F )

# p.value = 0.7883 > 0.05
# => нямаме основание да отхвърлим нулевата хипотеза.
# Нямаме основания да твърдим, че процентът на стоки с 
# грешна цена се е променил спрямо 2009 година.


###
# zad67 b
# p = вероятност стока в хипермаркета да е с грешна цена
# H0: p = 0.075
# H1: p < 0.075

x <- 14
n <- 200
p <- 0.075
z.obs <- (x/n - p)/sqrt(p*(1-p)/n)
z.obs
p.value <- pnorm(z.obs)
p.value

prop.test( x=14, n=200, p=0.075, alternative="less", correct=F )

# p.value = 0.3942 > 0.05
# => нямаме основание да отхвърлим нулевата хипотеза.
# Нямаме основания да твърдим, че процентът на стоки с 
# грешна цена е намалял спрямо 2009 година.


###
# zad68
# mu = средно количество течност, което налива автоматът
# H0: mu = 170
# H1: mu < 170

x.bar <- 168
sigma <- 3.9
n <- 50
mu <- 170

z.obs <- (x.bar-mu)/(sigma/sqrt(n))
z.obs
p.value <- pnorm(z.obs)
p.value

# p.value = 0.00014 < 0.05 
# => отхвърляме нулевата хипотеза в полза на алтернативната.
# Имаме основание да твърдим, че в средно автоматът налива 
# по-малко от 170 грама.


###
# zad69 a
# mu = средно ниво на хемоглобин при децата страдащи от болестта
# H0: mu = 14.6
# H1: mu != 14.6

x <- c(12.3, 11.4, 14.2, 15.3, 14.8, 13.8, 11.1, 15.1, 15.8, 13.2)
mu <- 14.6
n <- length(x)
t.obs <- (mean(x)-mu)/(sd(x)/sqrt(n))
t.obs
p.value <- 2*(1-pt(abs(t.obs), n-1))
p.value 

t.test( x, mu=14.6 )

# p.value = 0.1197 > 0.05
# => нямаме основание да отхвърлим нулевата хипотеза.
# Нямаме основание да твърдим, че средното ниво на хемоглобин при 
# децата страдащи от тази болест е различно от нормалното ниво от 14.6.


###
# zad69 b
# mu = средно ниво на хемоглобин при децата страдащи от болестта
# H0: mu = 14.6
# H1: mu < 14.6

x <- c(12.3, 11.4, 14.2, 15.3, 14.8, 13.8, 11.1, 15.1, 15.8, 13.2)
mu <- 14.6
n <- length(x)
t.obs <- (mean(x)-mu)/(sd(x)/sqrt(n))
t.obs
p.value <- pt(t.obs, n-1)
p.value 

t.test( x, mu=14.6, alternative="less" )

# p.value = 0.0598 > 0.05
# => нямаме основание да отхвърлим нулевата хипотеза.
# Нямаме основание да твърдим, че средното ниво на хемоглобин при 
# децата страдащи от тази болест е по-малко от 14.6.


###
# zad70
# mu_A = средна оценка при падане на вариант А
# mu_B = средна оценка при падане на вариант В
# H0: mu_A = mu_B
# H1: mu_A > mu_B

examAB <- read.table( "examAB.txt", header=T )
x <- examAB$points[examAB$variant=="A"]
y <- examAB$points[examAB$variant=="B"]
t.test( x, y, alternative="greater" )

# p.value = 0.01668 < 0.05
# => отхвърляме нулевата хипотеза в полза на алтернативната.
# Имаме основание да твърдим, че в средно студентите получават 
# по-малко точки ако им се е падне вариант В.

# алтернативен синтаксис
t.test( points ~ variant, data=examAB, alternative="greater" )


###
# zad71
# mu_X = средно време на реакция преди изпиване на 50 мл водка
# mu_Y = средно време на реакция след изпиване на 50 мл водка
# H0: mu_X = mu_Y
# H1: mu_X < mu_Y

react <- read.table( "reacttime.txt", header=T )
x <- react$before
y <- react$after
t.test( x, y, alternative="less", paired=T )
options(scipen=99)
t.test( x, y, alternative="less", paired=T )$p.value

# това ни дава същия резултат
t.test( x-y, alternative="less" )

# p.value = 0.000000000324 < 0.05
# => отхвърляме нулевата хипотеза в полза на алтернативната.
# Имаме основание да твърдим, че след изпиване на 50 мл водка
# времето на реакция в средно се увеличава.


###
# zad72
# p_A = вероятност машина А да произведе дефектен болт
# p_B = вероятност машина B да произведе дефектен болт
# H0: p_A = p_B
# H1: p_A != p_B

x <- c(8, 15)
n <- c(200, 200)

prop.test( x=x, n=n, correct=F )
prop.test( x, n, correct=F )

# p.value = 0.1327 > 0.05
# => нямаме основание да отхвърлим нулевата хипотеза.
# Нямаме основание да твърдим, че двете машини се различават
# по отношение на вероятността да произведат дефектен болт.


###
# zad73
# mu_X = средно съдържание на примеси при определяне по метод 1
# mu_Y = средно съдържание на примеси при определяне по метод 2
# H0: mu_X = mu_Y
# H1: mu_X != mu_Y

# копирали сме таблицата с данни (без заглавния ред) в "zad73.txt"
zad73 <- read.table( "zad73.txt" )
x <- zad73[,2]
y <- zad73[,3]

t.test( x, y, paired=T )

# p.value = 0.01026 < 0.05
# => отхвърляме нулевата хипотеза в полза на алтернативната.
# Не може да се приеме, че двата метода
# дават в средно едни и същи резултати.

d <- x - y
n <- length(d)
t.obs <- mean(d)/(sd(d)/sqrt(n))
t.obs
p.value <- 2*(1-pt(abs(t.obs), n-1))
p.value 


###
# zad74
# mu_X = средно време за четене при първия шрифт
# mu_Y = средно време за четене при втория шрифт
# H0: mu_X = mu_Y
# H1: mu_X != mu_Y

x.bar <- 7.88
s.x <- 1.73
y.bar <- 8.48
s.y <- 2.12
n <- 50
m <- 50

t.obs <- (x.bar - y.bar) / sqrt(s.x^2/n + s.y^2/m)
t.obs
df <- (s.x^2/n + s.y^2/m)^2 / (((s.x^2/n)^2)/(n-1) + ((s.y^2/m)^2)/(m-1))
df
p.value <- 2*(1-pt(abs(t.obs), df))
p.value 

# p.value = 0.1243729 > 0.05
# => нямаме основание да отхвърлим нулевата хипотеза.
# Нямаме основание да твърдим, че средното време за четене  
# е различно за двата шрифта.


###
# zad75
# p1 = вероятност някой да е вегетарианец през 2007
# p2 = вероятност някой да е вегетарианец през 2019
# H0: p1 = p2
# H1: p1 < p2

x <- c(26, 43)
n <- c(500, 540)
prop.test( x=x, n=n, alternative="less", correct=F )

# p.value = 0.03683 < 0.05
# => отхвърляме нулевата хипотеза в полза на алтернативната.
# Имаме основание да твърдим, че процентът на вегетарианците 
# през 2019 година се е увеличил спрямо 2007 година.


###
# zad76
sim1 <- function(n, alpha) {
  x <- runif(n, 5, 9)
  ci <- t.test(x, conf.level=1-alpha)$conf.int[1:2]
  cnd1 <- ( ci[1] <= 7 & ci[2] >= 7 )
  cnd1
}

rs1 <- replicate( 10000, sim1(n=500, alpha=0.05) )
table(rs1)/length(rs1)


###
# zad77
sim2 <- function(n, alpha) {
  x <- runif(n, 5, 9)
  p.val <- t.test(x, mu=7)$p.value
  cnd2 <- ( p.val > alpha )
  cnd2
}

rs2 <- replicate( 10000, sim2(n=500, alpha=0.05) )
table(rs2)/length(rs2)


###
# zad78
sim3 <- function(n, alpha) {
  x <- runif(n, 5, 9)
  ci <- t.test(x, conf.level=1-alpha)$conf.int[1:2]
  p.val <- t.test(x, mu=7)$p.value
  cnd1 <- ( ci[1] <= 7 & ci[2] >= 7 )
  cnd2 <- ( p.val > alpha )
  # cnd1 == cnd2
  c( cnd1, cnd2 )
}

rs3 <- replicate( 10000, sim3(n=500, alpha=0.05) )
cnd1r <- rs3[1, ]
cnd2r <- rs3[2, ]
table(cnd1r, cnd2r)


###
# zad79
sim4 <- function(n, mu, delta) {
  x <- rnorm(n, mean=mu, sd=1)
  y <- rnorm(n, mean=mu+delta, sd=1)
  t.test(x,y)$p.value
}

rs4 <- replicate( 10000, sim4(n=1000, mu=5, delta=0.2) )
sum(rs4<=0.05)/length(rs4)


###
# zad80
# p_i = вероятност да се падне i, i=1...6
# H0: p_i = 1/6, i=1...6
# H1: p_i != 1/6 за поне едно i

x <- c(28, 36, 36, 30, 27, 23)
probs <- rep(1/6, 6)

n <- sum(x)
k <- length(probs)
chi2.obs <- sum( (x - n*probs)^2 / (n*probs) )
chi2.obs
p.value <- 1-pchisq(chi2.obs, df=k-1)
p.value

chisq.test(x, p=probs)
chisq.test(x, p=probs)$p.value

# p.value > 0.05 
# => нямаме основания да отхвърлим H0.
# Можем да считаме, че зарът е правилен 
# (всяка от страните се пада с вероятност 1/6).

tb1 <- rbind( probs, x/sum(x) )
colnames(tb1) <- as.character(c(1:6))
rownames(tb1) <- c("probability (H0)", "observed freq")
barplot(tb1, beside=T, legend=T, ylim=c(0,0.3))


###
# zad81
# p_E = вероятност да срещнем буква Е
# p_T = вероятност да срещнем буква T
# ...
# H0: (p_E, p_T, ...) = (0.1202, 0.0910, ...)
# H1: (p_E, p_T, ...) != (0.1202, 0.0910, ...)

load("letterFreq.RData")
probs*100
x1

chisq.test(x1, p=probs)

# p.value < 0.05 
# => отхвърляме H0 в полза на H1.
# Нямаме основания да твърдим, че вероятностите за срещане 
# на съответните букви са както в английския език.

tb1 <- rbind( probs, x1/sum(x1) )
rownames(tb1) <- c("probability (H0)", "observed freq")
barplot(tb1, beside=T, legend=T, args.legend=list(x="top"))


###
# zad84
library(MASS)
tb <- table( survey$Sex, survey$Smoke )
tb

# H0: пушенето и пола са независими
# H1: пушенето и пола не са независими (има връзка между пушене и пол)

n <- sum(tb)
df <- (nrow(tb)-1)*(ncol(tb)-1)
sex <- apply(tb, 1, sum)
smk <- apply(tb, 2, sum)

expected <- (sex %o% smk)/n
observed <- tb
chi2.obs <- sum( (observed - expected)^2 / expected )
chi2.obs
p.value <- 1-pchisq(chi2.obs, df)
p.value

chisq.test(tb)

# p.value > 0.05 
# => нямаме основания да отхвърлим нулевата хипотеза.
# Нямаме основания да твърдим, че има връзка между пушенето и пола.

observed
chisq.test(tb)$observed
expected
chisq.test(tb)$expected


###
# zad85
eyecol <- read.table("ManWomanEye.txt", header=T)
attach(eyecol)
tb <- table(man, woman, deparse.level=2)
tb

# H0: цвета на очите на мъжа и цвета на очите на жената са независими
# H1: има връзка между цвета на очите на мъжа и цвета на очите на жената

n <- sum(tb)
df <- (nrow(tb)-1)*(ncol(tb)-1)
males <- apply(tb, 1, sum)
females <- apply(tb, 2, sum)

expected <- (males %o% females)/n
observed <- tb
chi2.obs <- sum( (observed - expected)^2 / expected )
chi2.obs
p.value <- 1-pchisq(chi2.obs, df)
p.value

chisq.test(tb)

# p.value < 0.05 
# => отхвръляме нулевата хипотеза в полза на алтернативната.
# Можем да твърдим, че има връзка между
# цвета на очите на мъжа и цвета на очите на жената.

mosaicplot(tb)
barplot(tb)
barplot( prop.table(tb, 1) )
barplot( prop.table(tb, 2) )


###
# zad88
alco <- read.table("bac.txt", header=T)

# a)
m1 <- lm( bac ~ beers, data=alco )
m1
# y = съдържание на алкохол в кръвта (bac)
# x = брой изпити бутилки бира (beers)
# модел:
# y = beta0 + beta1*x + eps
# [ bac = beta0 + beta1*beers + eps ]
# оценено регресионно уравнение:
# y.hat = -0.01270 + 0.01796*x

plot( bac ~ beers, data=alco )
abline( coef(m1), lwd=2 )

# графика на остатъците срещу y.hat
plot( fitted(m1), resid(m1) )

# б)
# При изпиване на още една бира съдържанието на алкохол в кръвта
# се увеличава средно с 0.01796.
# 
# При нула изпити бири средното съдъжание на алкохол в кръвта е -0.01270.

# в)
# H0: beta1 = 0
# H1: beta1 != 0

summary(m1)
summary(m1)$coefficients
p.value <- summary(m1)$coefficients[2,4]
p.value < 0.05

# p.value < 0.05 => отхвърляме H0.
# Можем да твърдим, че има линейна връзка между броя на 
# изпитите бутилки бира и съдържанието на алкохол в кръвта.

# г)
# H0: beta1 = 0.02
# H1: beta1 != 0.02

# доверителни интервали (ДИ) за beta0 и beta1
confint(m1)

# 0.02 е в ДИ [0.0128, 0.0231] за beta1 => не отхвърляме H0.
# Нямаме основания да отхвърлим хипотезата, че при изпиването на 
# още една бира съдържанието на алкохол в кръвта се увеличава 
# средно с 0.02.

# д)
predict( m1, data.frame( beers=c(5) ), interval="confidence" )
predict( m1, data.frame( beers=5 ), interval="confidence" )

# [ -0.01270 + 0.01796*5 = fit ]
# 
# Доверителният интервал е [0.066, 0.088]

# е)
plot( bac ~ beers, data=alco )
abline( coef(m1), lwd=2 )

xx <- data.frame( beers=seq(1, 9, 0.5) )

# доверителни интервали
cint <- predict( m1, xx, interval="confidence" )
lines( xx$beers, cint[,2], type="l", lty="dotted", lwd=2 )
lines( xx$beers, cint[,3], type="l", lty="dotted", lwd=2 )

# интервали за прогноза
pint <- predict( m1, xx, interval="prediction" )
lines( xx$beers, pint[,2], type="l", lty="dotted", col="gray", lwd=2 )
lines( xx$beers, pint[,3], type="l", lty="dotted", col="gray", lwd=2 )


###
# zad89

# a)
set.seed(12)
n <- 50
beta0 <- 2
beta1 <- 1.5
sigma <- 2
x <- runif(n, 1, 7)
eps <- rnorm(n, 0, sigma)
y <- beta0 + beta1*x + eps

m1 <- lm(y~x)
plot(x, y)
abline( coef(m1), lwd=2 )
abline( a=beta0, b=beta1, col="coral", lwd=2 )

summary(m1)
summary(m1)$r.squared
confint(m1)

# б)
set.seed(12)
n <- 50
beta0 <- 2
beta1 <- 1.5
sigma <- 1
x <- runif(n, 1, 7)
eps <- rnorm(n, 0, sigma)
y <- beta0 + beta1*x + eps

m2 <- lm(y~x)
plot(x, y)
abline( coef(m2), lwd=2 )
abline( a=beta0, b=beta1, col="coral", lwd=2 )

summary(m2)
summary(m2)$r.squared
confint(m2)

# в)
set.seed(12)
n <- 50
beta0 <- 2
beta1 <- 0.17
sigma <- 1
x <- runif(n, 1, 7)
eps <- rnorm(n, 0, sigma)
y <- beta0 + beta1*x + eps

m3 <- lm(y~x)
plot(x, y, ylim=c(0,13))
abline( coef(m3), lwd=2 )
abline( a=beta0, b=beta1, col="coral", lwd=2 )

summary(m3)
summary(m3)$r.squared
confint(m3)


###
# zad90
set.seed(12)
n <- 50
beta0 <- 2
beta1 <- 1.1
sigma <- 2.5
x <- runif(n, 1, 7)
eps <- rnorm(n, 0, sigma)
y <- beta0 + beta1*x^2 + eps

m4 <- lm(y~x)
plot(x, y)
abline( coef(m4), lwd=2 )

summary(m4)
summary(m4)$r.squared
confint(m4)

plot( fitted(m4), resid(m4) )


###
# zad91
satgpa <- read.table("satgpa.txt", header=T)

# scatter plot matrix
pairs( satgpa, gap=0, cex.labels=0.9 )

# а)
m1 <- lm( fy_gpa ~ hs_gpa, data=satgpa )
m1
# y = успех от първата година в колежа (fy_gpa)
# x = успех от гимназията (hs_gpa)
# модел:
# y = beta0 + beta1*x + eps
# оценено регресионно уравнение:
# y.hat = 0.09132 + 0.74314*x

plot( fy_gpa ~ hs_gpa, data=satgpa )
abline( coef(m1), lwd=2 )

# графика на остатъците срещу y.hat
plot( fitted(m1), resid(m1) )

# б)
# Успех от гимназията по-висок с 1 съответства на 
# успех от първата година в колежа по-висок средно с 0.74314.

# H0: beta1 = 0
# H1: beta1 != 0
summary(m1)
p.value <- summary(m1)$coefficients[2,4]
p.value < 0.05 
# => отхвърляме H0.
# Можем да твърдим, че има линейна връзка между успеха от гимназията
# и успеха от първата година в колежа.

# в)
# доверителен интервал
predict( m1, data.frame( hs_gpa=3.5 ), interval="confidence" )

# интервал за прогноза
predict( m1, data.frame( hs_gpa=3.5 ), interval="prediction" )

# г)
m2 <- lm( fy_gpa ~ hs_gpa + sat_sum, data=satgpa )
summary(m2)
plot( fitted(m2), resid(m2) )

m3 <- lm( fy_gpa ~ hs_gpa + sat_m, data=satgpa )
summary(m3)
plot( fitted(m3), resid(m3) )

m4 <- lm( fy_gpa ~ hs_gpa + sat_v, data=satgpa )
summary(m4)
plot( fitted(m4), resid(m4) )

summary(m1)$adj.r.squared
summary(m2)$adj.r.squared
summary(m3)$adj.r.squared
summary(m4)$adj.r.squared
# Моделът m2 има най-голям adj.r.squared => е най-добър от трите
# (ако считаме, че моделът с най-висок adj.r.squared е най-добър).


###
# zad92
cher <- read.table("cherry.txt", header=T)
# scatter plot matrix
pairs( cher, gap=0, cex.labels=0.9 )

# а)
m1 <- lm( volume ~ diam, data=cher )
m1
# y = обем (volume)
# x = диаметър (diam)
# модел:
# y = beta0 + beta1*x + eps
# оценено регресионно уравнение:
# y.hat = -36.943 + 5.066*x

plot( volume ~ diam, data=cher )
abline( coef(m1), lwd=2 )

summary(m1)
plot( fitted(m1), resid(m1) )

# б)
# Ако диаметърът е по-голям с 1 инч, 
# обемът ще е по-голям средно с 5.066 кубични фута.

# в)
m2 <- lm( volume ~ diam + height, data=cher )
m2
# y = обем (volume)
# x1 = диаметър (diam)
# x2 = височина (height)
# модел:
# y = beta0 + beta1*x1 + beta2*x2 + eps
# оценено регресионно уравнение:
# y.hat = -57.9877 + 4.7082*x1 + 0.3393*x2

summary(m2)
plot( fitted(m2), resid(m2) )

# Ако диаметърът е по-голям с 1 инч при фиксирана височина, 
# обемът ще е по-голям средно с 4.7082 кубични фута.

# Ако височината е по-голяма с 1 фут при фиксиран диаметър, 
# обемът ще е по-голям средно с 0.3393 кубични фута.

# г)
ci.g <- predict( m2, data.frame( diam=14, height=70 ), interval="confidence" )
ci.g

# д)
cher$diam2 <- cher$diam^2
m3 <- lm( volume ~ diam2 + height, data=cher )
summary(m3)
plot( fitted(m3), resid(m3) )

ci.d <- predict( m3, data.frame( diam2=14^2, height=70 ), interval="confidence" )
ci.d

# Доверителният интервал с модел m3 е по-къс:
ci.g[3] - ci.g[2]
ci.d[3] - ci.d[2]

summary(m1)$adj.r.squared
summary(m2)$adj.r.squared
summary(m3)$adj.r.squared
# Моделът m3 има най-голям adj.r.squared

# Друг начин да включим квадрата на диаметъра:
m4 <- lm( volume ~ I(diam^2) + height, data=cher )
predict( m4, data.frame( diam=14, height=70 ), interval="confidence" )


###
# zad93
duke <- read.csv("duke_forest.csv", header=T)
pairs( duke[,c(2,3,4,5,7,11)], gap=0, cex.labels=0.9 )

# backward elimination:
# Построяваме модел включващ всички възможни предиктори.
# Премахваме предиктора с най-голямо p.value докато получим модел,
# в който всички предиктори имат p.value < 0.05.

options(scipen=999)

m01 <- lm( price ~ bed + bath + area + year_built + lot, data=duke )
summary(m01)$coefficients

m02 <- lm( price ~ bath + area + year_built + lot, data=duke )
summary(m02)$coefficients

m03 <- lm( price ~ bath + area + lot, data=duke )
summary(m03)$coefficients

# Получаваме модел m3 като резултат от backward elimination.

# Друг подход:
# В модела не е желателно да има предиктори, които са силно корелирани.
# От корелационната матрица виждаме, че bed, bath и area са силно корелирани помежду си.
cor( duke[,c(3,4,5)], use="complete.obs" )

# Затова в модела може да включим само една от променливите bed, bath и area, 
# като запазим year_built + lot.

m21 <- lm( price ~ area + year_built + lot, data=duke )
summary(m21)$coefficients

m22 <- lm( price ~ bed + year_built + lot, data=duke )
summary(m22)$coefficients

m23 <- lm( price ~ bath + year_built + lot, data=duke )
summary(m23)$coefficients

summary(m21)$adj.r.squared
summary(m22)$adj.r.squared
summary(m23)$adj.r.squared

# От горните три модела, m21 има най-голям adj.r.squared. 
# В модела m21 всички предиктори имат p.value < 0.05.

# Ако сравним adj.r.squared на m21 и m03, ще видим, че не се различават съществено.
summary(m03)$adj.r.squared


###
# zad94
sim.lm.a <- function(n) {
  x <- runif(n, 1, 10)
  y <- 2 + 5*x + rnorm(n, 0, 5) 
  m1 <- lm(y~x)
  c( coef(m1)["x"], confint(m1, "x"), use.names=F )
}

sim.lm.b <- function(n) {
  x <- runif(n, 1, 10)
  y <- 2 + 5*x + rexp(n, 1/5)
  m1 <- lm(y~x)
  c( coef(m1)["x"], confint(m1, "x"), use.names=F )
}

smry <- function(rs) {
  mean.b1.hat <- mean( rs[1,] )
  ci.coverage <- sum( rs[2,] <= 5 & 5 <= rs[3,] ) / ncol(rs)
  mean.ci.len <- mean( rs[3,] - rs[2,] )
  c(mean.b1.hat, ci.coverage, mean.ci.len)
}


res.a.30 <- replicate( 10000, sim.lm.a(30) )
res.b.30 <- replicate( 10000, sim.lm.b(30) )

smry(res.a.30)
smry(res.b.30)

res.a.50 <- replicate( 10000, sim.lm.a(50) )
res.b.50 <- replicate( 10000, sim.lm.b(50) )

smry(res.a.50)
smry(res.b.50)

res.a.100 <- replicate( 10000, sim.lm.a(100) )
res.b.100 <- replicate( 10000, sim.lm.b(100) )

smry(res.a.100)
smry(res.b.100)

res.a.500 <- replicate( 10000, sim.lm.a(500) )
res.b.500 <- replicate( 10000, sim.lm.b(500) )

smry(res.a.500)
smry(res.b.500)


###
