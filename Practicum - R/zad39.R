barplot(table(Smoke, Exer), legend = T)
barplot(table(Smoke, Exer), legend = T,
        args.legend = list(x="top"))

barplot(100*prop.table(tab.smoke.exer, 2), 
        legend = T, xlim = c(0,6),
        args.legend = list(x="right"))