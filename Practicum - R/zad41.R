table(Pulse, useNA = "ifany")
pulse.grp<-cut(Pulse, breaks=seq(30,110,10))
pulse.grp

table(pulse.grp)

barplot(table(pulse.grp))

hist(Pulse)
hist(Pulse, breaks=seq(30,110,5))
     
stripchart(Pulse, method="stack", pch=20)
