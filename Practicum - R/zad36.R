table(survey$Exer)

attach(survey)
table(Exer)

sort(table(Exer), decreasing = T)

100*table(Exer)/length(Exer)

barplot(table(Exer))
barplot(sort(table(Exer), decreasing = T))
barplot(100*table(Exer)/length(Exer))

pie(table(Exer))
pie(table(Exer), col = c("red", "yellow", "blue"))
