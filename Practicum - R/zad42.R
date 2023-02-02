table(Age, useNA = "ifany")
age.grp<-cut(Age, breaks=seq(15,75,10))

table(age.grp)

hist(Age)
stripchart(Age, method="stack", pch=20)
