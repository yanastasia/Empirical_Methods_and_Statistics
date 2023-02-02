barplot(table(Exer, Smoke), legend = T,
        args.legend = list(x="topright"))

barplot(table(Exer, Smoke), legend = T,
        beside = T,
        args.legend = list(x="topright"))

text("abc", x=2, y=20)

tab.exer.smoke<-table(Exer, Smoke)
barplot(100*prop.table(tab.exer.smoke, 2),
        legend = T, xlim=c(0,7),
        args.legend=list(x="right"))
