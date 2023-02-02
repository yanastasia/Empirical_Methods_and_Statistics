#2.1
miles<-c(65311, 65624, 65908, 66219, 66499, 66821, 67145, 67447)
x<-diff(x)
min(miles)
max(miles)
mean(miles)

#2.2
commute<-c(17, 16, 20, 24, 22, 15, 21, 15, 17, 22)
max(commute)
min(commute)
mean(commute)
mistaken<-which(commute==24)
commute[mistaken]<-18
mean(commute)
sum(commute>=20)
sum(commute<17)/length(commute)*100

#2.3
bill<-c(46, 33, 39, 37, 46, 30, 48, 32, 49, 35, 30, 48)
sum(bill)
min(bill)
max(bill)
sum(bill>40)
sum(bill>40)/length(bill)*100

#2.4
cars<-c(9000, 9500, 9400, 9400, 10000, 9500, 10300, 10200)
mean(cars)
mean(cars)>9500
min(cars)
max(cars)

#2.5
x = c(1,3,5,7,9)
#1. adds 1 to each element of x
#2. multiplies every element of y by 2
#3.returns how many elements are in x and y
#4. adds x and y
#5. how many elements are >5: 7 and 9; and sum of elements that are >5: 7+9
sum(x>5)
sum(x[x>5])
#6. how many elements are >5 or <3: 1, 7, 9 
sum(x>5 | x< 3)
#7. third element of y
#8. all elements except the third one of y
#10. elements of y that are >=7



  
}
