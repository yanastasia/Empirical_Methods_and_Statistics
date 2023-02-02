library(MASS)
names(survey)
head(survey)
summary(survey)

#zad 1
prob.regul<-sum(survey$Smoke=="Regul", na.rm=TRUE)/length(survey$Smoke)
prob.regul

prob.regulANDmale<-sum(survey$Smoke=="Regul" & survey$Sex=="Male", na.rm=TRUE)/length(survey$Smoke)
prob.regulANDmale

prob.male<-sum(survey$Sex=="Male", na.rm=TRUE)/length(survey$Smoke)
prob.regulANDmale/prob.male

prob.regulANDmale/prob.regul

#zad2
summary(survey$Smoke)
table(survey$Smoke, useNA="ifany")
barplot(table(survey$Smoke, useNA="ifany"),
      main="Smoking", 
      col<-c("black", "green", "lightgrey", "darkgrey"))
