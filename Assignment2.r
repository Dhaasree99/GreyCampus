# 1.
# Result of final world cup of football is France- 4 and Croatia - 2. 
#Please use the control structure to print results as Team ---- Wins. ----- 
#should be country name.
france=4
croatia=2
if(france>croatia){
  print("France has won the match")
}else{
  print("Croatia has won the match")
  }

 
#2.
#mtcars dataset has several factor variables. However, R is reading them numeric. 
#Please convert them into factor using a for loop. 
#Please use column 8 to 11 for loop.
mtcars
typeof(mtcars)
print(mtcars$vs)
mycars<-c(mtcars$vs,mtcars$am,mtcars$gear,mtcars$carb)
mycars
for(i in mycars){
  print(as.factor(mycars))
}

#3.
#Write a function to get percentage of NAs in each column
install.packages("readxl")
library(readxl)
data<-read_excel("C:\\Users\\LENOVO\\Downloads\\Dataset - 2.1.xlsx")
sapply(data,function(x) sum(is.na(x)))

#4.
#Write a function to get percentage of NAs in each row
install.packages("readxl")
library(readxl)
data<-read_excel("C:\\Users\\LENOVO\\Downloads\\Dataset - 2.1.xlsx")
sapply(data,function(y) sum(is.na(y)))

#5.
#Write a function to get summary of numeric columns (use summary function) 
#such as THC, CO, CO2 etc. in data set. 
#In same function try to generate boxplot using base R.
boxplot(data$THC)
boxplot(data$CO)
boxplot(data$CO2)

#6.
#Write a function to create histograms of numeric columns such as THC, CO, CO2 
#etc. in data set. Use ggpot2 to generate figure.
install.packages("ggplot2")
library(ggplot2)
qplot(data$THC, geom="histogram") 

qplot(data$CO, geom="histogram")

qplot(data$CO2, geom="histogram")

#7.
#Data set contains date columns. All of these date columns are untidy. 
#Please create a better formatted dataset. 
#Date should be dd/mm/yyyy in final format. Use column 2, 3 and 5 only
date_data=read.csv("C:\\Users\\LENOVO\\Downloads\\Data set - 2.2.csv", header = TRUE)
better_date=date_data$First.FD.Date
better_date1=format(as.Date(better_date, "%B %d %Y"), "%m/%d/%Y")
better_date1


#8.
#Date of birth column contains month in string format. 
#Please create a tidy data column with months in numeric format.
#Now your data should be similar to previous question.
