#Zad 2

#p1 = veroqtnost w proba ot qdki da ima fustuci
#p2 = -||- leshnici
#...

#H0: (p1, p2, p3, p4) = (0.5, 0.2, 0.2, 0.2)
#H1: (p1, p2, p3, p4) != (0.5, 0.2, 0.2, 0.2)

x<-c(267, 91, 103, 39)
probs<-c(0.5, 0.2, 0.2, 0.1)
chisq.test(x, p = probs)

p.value = 0.2144>0.05
#=> ne othrljame H0
#mozhe da se prieme che mashinata smestwa qdkite w zhelanoto suotnoshenie

#Zad 3
#p = verojatnost robot da zglobi defekten element
#H0: p = 0.035
#H1: p < 0.035

prop.test(x = 15, n = 500, p = 0.035, alternative = "less", correct = T)

p_value = 0.3132>0.05
#=> ne othvrljame H0
#ne mozhe li da se tvrdi che procentut defektni elementi pri izpolzvane na 
#robot e po-maluk otkolkoto pri sgobljavane na chovek

#Zad 4 
#mu_x = sredno vreme do iznosvane na gumi ot marka 1
#mu_y = sredno vreme do iznosvane na gumi ot marka 2

#H0: mu_x = mu_y
#H1: mu_x > mu_y

t.test(x, y, alternative = "greater")

p_value = 0.04609 < 0.05
#=> othvrljame H0
#Mozhe da se tvrdi che srednoto izminato rastojanie do 
#iznosvane e po-golqmo pri gumite ot marka 1

#Zad 5
#mu_1 = sredna ocenka ot algebra 1
#mu_2 = sredna ocenka ot algebra 2

#H0 : mu_1 = mu_2
#H1: mu_1 > mu_2

#vzimame razlikite ot a1 i a2 i posle pravim sredno
#paired t-test -> kogato imame nqkakva vrska koqto svrzva i-tiq element ot danni 
# na ediniq vektor i i-tiq ot drugiq

#ako e enda izvadka shte pishe one..?

t.test(a1, a2, alternative = "greater", paired=T)
#p-value = 1.422e-05 < 0.05
#=> othvrljame H0
#mozhe da se tvrdi, che v sredno ocenkite po Algebra 1 
# sa po-visoki ot tezi po algebra 2

#Zad 6
#a)
# grade = beta0 + beta1*study.hours + eps

#grade = 1.01617 + 0.15806*study.hours

#grade - otklik(response)
#study.hours - prediktor(predictor)

#b) pri edin chas poveche podgotovka za izpita ocenkata e po-visoka
#sredno s 0.15806

#v) H0: beta1 = 0
#   H1: beta1 != 0
#hipotezata q proverqwame za nqkoj parametar na modela, kojto e neizvesten
# koeficient na hipoteza 2 red posledna kolona
#p-value = 2.9e-12 < 0.05
#=> othvrljame H0
#mozhe da se tvrdi che ima linejna vrzka mezhdu ocenkata i chasovete, 
#otdeleni za podgotovka

#g)
# grade = beta0 + beta1*study.hours + beta2*lectures + eps

# grade = 0.54255 + 0.14767*study.hours + 0.09432*lectures

#pri edin chas povishe podgotovka za izpita i fiksiran broj
#poseteni lekcii ocenkata e po-visoka sredno s 0.14767

#pri oshte edna posetena lekcija i fiksirani chasove za podgotovka za izpita
# ocenkata e po-visoka sredno s 0.9432


#Zad 7
exams<-read.table("exams.txt", header = T)
attach(exams)

#fakultetni nomera na studenti, koito imat ocenka 4 ili poveche po EAI
fn[EIA>=4]

#Броя на студентите от специалност КН, които имат оценка 5 по ДАА;
sum(spec=="KN" & DAA==5)

#Средната оценка по ЕАИ на студентите от специалност КН;
mean(EAI[spec=="KN"])

#Медианата на оценка по ДАА на студентите, които има оценка 5 по ЕАИ;
median(DAA[EAI==5])

#Похдодяща графика за успеха по ДАА в зависимост от специалността.
boxplot(DAA~spec)
barplot(table(DAA, spec), beside=T, legend = T)

#Zad 8
sim.throws <- functions() {
  x<-sample(c(1:6), 4, replace = T)
  sum(x[1:2]) > sum(x[3:4])
}

rs<-replicate(10000, sim.throws())
sum(rs)/length(rs)