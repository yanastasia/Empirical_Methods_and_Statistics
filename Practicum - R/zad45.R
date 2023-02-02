getwd()

grades<-read.table("exam_grades.txt", header=T)
attach(grades)

plot(test1, course.grade)
plot(test2, course.grade)
plot(test3, course.grade)

cor(test1, course.grade, use = "complete.obs")
cor(test2, course.grade, use = "complete.obs")
cor(test3, course.grade, use = "complete.obs")

boxplot(course.grade~sex)

median(course.grade[sex=="Man"])
median(course.grade[sex=="Woman"])

mean(course.grade[sex=="Man"])
mean(course.grade[sex=="Woman"])

boxplot(course.grade~semester)

