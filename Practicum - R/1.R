#Математически функции
log(exp(1)

28%%10
27/1000000
5000*5000
options(scipen=999)

options(scipen=0)

#vectors
x<-c(5, 12, 11, 14, 2, 3, 14, 10, 3)
x[3]
x[1:5]
x[c(2, 5, 9)]
x[-4]
x[-c(2,3)]
x[x>10] стойности за кои условието е изпълнето
length(x)
min(x)
max(x)
head(x, 3) prvi 3 elementa
tail(x, 3) posledni 3 elementa
x>10
sum(x>10)
which(x>10)
diff(x)
cumsum(x)
sum(x)
x^2
sort(x)
sort(x, decreasing=T)

x[order(x)]
x[order(x, decreasing=T)]

rm(x)
x

x<-c(1, 3, 5, 11, 15)
class(x)

x<-as.integer(c(1,3,5,11,15))
class(x)

y<-c("Y", "Y", "N")
class(y)

z<-c(TRUE, TRUE, FALSE)
class(z)

#numeric e realno chislo, a integer e cqlo chislo

x<-vector("logical", length=5)
x

y<-vector("numeric", length = 5)
y

z<-vector("character", length = 5)
z

x<-c(5, 5, 5, 7, 7, 7)
y<-c(2,2,1)

x+y #ako ne sa s ednakva dlzhina pokratkiq kato svrshi zapochva da go 
    #chete otnovo ot nachaloto, dokato ne stigne do kraq na po-dlgiq

y<-c(2,2,1,1)
x+y


#Generirane na redici

rep(5, times=8)

rep(c(1,2), times=5)

rep(c(1,2), each=5)

rep(c(1,2), length.out=7)

rep(c("a", "b"), times=5)

rep(c("a","b"), each=3)

5:12
10:1

seq(from=1, to=10, by=2)
seq(from=10, to=1, by=-2)
seq(from=0, to=1, by=0.2)
seq(from=0, to=1, length.out=11)

# Matrici

M<-rbind(c(5,3,5,6), c(8,3,7,4))
M

M[2,3]

M[,3]

M[2,]

M<-cbind(c(5,3,5,6), c(8,3,7,4))
M

t(M) #transponirana
M[c(3,1)]

#изпит в сесия
#3 изпита в сесия
#поне 3 на всяк
#1 домашно и 1 контролно за освобождаване
#контролно последната седмица от семестъра, в неделя
#в зала на лист
#поне 3 от контролно и домашно и ако ни харесва, остава оценката

M[order(M[,1]), ]

M<-matrix(c(1:12), nrow=3, ncol=4)
M

M<-matrix(c(1:12), nrow=3, ncol=4, byrow=TRUE)
M

head(M,2)
tail(M,2)

sqrt(M)

rownames(M)<-c("a","b","c")
colnames(M)<-c("X1", "X2", "X3", "X4")
M

M[,"X3"]
M["b",]

#Data frame

x<-c(5,8,11,3,2,9,4)
y<-c("Y","Y","N","Y","N","N","Y")
df<-data.frame(x,y)
df

str(df)

df$x

df$y

df$x[4]
df[,1]
df[5,]

df[,"x"]
df$z<-seq(from=1,to=14, by=2)
srt(df)

df[3,c("x","z")]

df[c(5,7),c(2,3)]
df$x[df$z<=5]
df$x[df$y=="N"]
df[df$z<=5, c("x","z")]

#polezni funkcii

getwd()
setwd(dir)
sample(c(1:10),2,replace=TRUE) #generirane 2 sluchaqni elementa ot 1 do 10, s povtorenie (replace=TRUE)
a<-sample(c(1:10),2,replace=TRUE)
a

Nrep<-10000
dice<-sample(c(1:6),Nrep, replace=TRUE)
sum(dice==6)/Nrep

#1/6







