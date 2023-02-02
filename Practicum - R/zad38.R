#a 
tb<-100*table(Smoke)/length(Smoke)
tb[2]
tb["Never"]

#b
table(Smoke, Exer)
table(Smoke, Exer)[2,1]
table(Smoke, Exer)["Never", "Freq"]

#v
100*table(Smoke, Exer)/sum(table(Smoke, Exer))

tab.smoke.exer<-table(Smoke, Exer)
100*prop.table(tab.smoke.exer)

100*prop.table(tab.smoke.exer)[2,1]
100*prop.table(tab.smoke.exer)["Never","Freq"]

#g
#100*prop.table(tab.smoke.exer)
100*prop.table(tab.smoke.exer, margin=1)
100*prop.table(tab.smoke.exer, margin=1)[2,1]

#d
100*prop.table(tab.smoke.exer, margin=2)
100*prop.table(tab.smoke.exer, margin=2)[2,1]