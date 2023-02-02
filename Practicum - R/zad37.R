table(Smoke)
table(Smoke, useNA="ifany") ## s <NA>

sort(table(Smoke), decreasing = T)
100*table(Smoke)/length(Smoke)

barplot(table(Smoke))
barplot(sort(table(Smoke), decreasing = T))
barplot(100*table(Smoke)/length(Smoke))

pie(table(Smoke))