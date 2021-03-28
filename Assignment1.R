#1.
#Vector and matrix difference
#Vector is a one-dimensional data structure while matrix is a two-dimensional data structure

#Vector and matrix similarity
#Both the data structures take same type of data structure that is only one type od data type like only num or only character but not different data types

#2.
#matrix and data frame difference
#In a data frame the columns contain different types of data, but in a matrix all the elements are the same type of data

#matrix and data frame similarity
#Both can have rows and columns.

#3.
vec<-c(15,TRUE,"World")

#4.
marks<-c(95,91,88)
mark_sub<-c('Statitics','linear algebra','Calculus')
names(marks)=mark_sub
mark_sub

#5.
typeof(marks)
?matrix

#6.
dhana<- c(95, 91, 88)
sreya<- c(96, 94, 97)
vani<- c(88, 98, 85)
marks3=c(dhana,sreya,vani)
marks_box=matrix(marks3,nrow=3,ncol=3,byrow=FALSE)
colnames(marks_box)=c('dhana','sreya','vani')
rownames(marks_box)=c('Statitics','Linear Algebra','Calculus')
marks_box
?as.data.frame()

#7.
marks_box_df=as.data.frame(marks_box)
marks_box_df

#8.
country_names<-c('USA','India','Brazil','Russia','UK')
tot_cases<-c(28616660,10990603,10081693,4151984,4105675)
tot_deaths<-c(508012,156333,244955,82876,120365)
covid_cases=data.frame(country_names,tot_cases,tot_deaths)
covid_cases

#9.
mtcars
