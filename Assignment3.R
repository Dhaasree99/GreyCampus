install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)
library(DT)
install.packages(moments)
library(moments)
install.packages("ggplot2")
library(ggplot2)
covid= read.csv ("C:\\Users\\LENOVO\\Downloads\\COVID19 (1).csv",stringsAsFactors = FALSE,na.strings =c ("","NA") )
str(covid)

#Step 1: 
#Keep rows containing country information and remove the rest of the rows. 
#Apart from the country, you should not be having any other row. 
#Move on to the next step only after finishing this.
datatable(covid)
covid_1=covid %>%
  slice(9:229) %>%
  select(3:20)
datatable(covid_1)

#Step 2: 
#Calculate the missing percentage of each column using a function. 
#If any column has missing data more than 5%, please remove it. (Do not try this for rows)

head(is.na(covid_1))
colSums(is.na(covid_1))
miss <- function(x){
  (sum(is.na(x))/length(x))*100
}
miss_per_col <- apply(covid_1,2,miss)
miss_per_col

covid_na <- covid_1 %>%
  purrr::discard(~sum(is.na(.x))/length(.x)*100>=10)
datatable(covid_na)

#Step 3:
# Give a better column name after cleaning your data.

covid_new <- covid_na %>%
  rename(Country= "Country.Other",
         Totalcases_per_million ="Tot.Cases.1M.pop",
         Deaths_per_million ="Deaths.1M.pop",
         Total_tests ="TotalTests",
         Tests_per_million ="Tests.1M.pop",
         X1_Caseevery_X_ppl=" X1.Caseevery.X.ppl",
         X1_Deathevery_X_ppl=" X1.Deathevery.X.ppl",
         X1_Testevery_X_ppl="X1.Testevery.X.ppl")

datatable(covid_new)
str(covid_new)

comma_remove <- function(x){
  gsub(",","",x)
}
corona_final=as.data.frame(apply(covid_new,MARGIN =2,FUN=comma_remove))
str(corona_final)
head(corona_final)
columns<- c(2:10,12:14)
corona_final[ , columns]<-lapply(columns,function(x) as.numeric(corona_final[[x]]))
str(corona_final)

datatable(corona_final)

#Create plots for total cases, total death, and total recovery.
#Explain with a figure for each.

ggplot(corona_final, aes(x=TotalCases))+
  geom_histogram(bins=500)
#highly skewed data

ggplot(corona_final, aes(x=TotalDeaths))+
  geom_histogram(bins=500)
#highly skewed data

ggplot(corona_final,aes(x=TotalRecovered))+
  geom_histogram(bins = 500)
#highly skewed data

#Create a plot to examine the correlation between total cases and total population.
#Explain if there is any correlation between total cases and total population.
ggplot(corona_final,aes(x=TotalCases,y=Population))+
  geom_point()
#Create a plot to examine the correlation between Tot Cases/1M pop and total population. 
#Explain if there is any correlation between them?
ggplot(corona_final,aes(x=TotalCases,y=Tot.Cases.1M.pop))+
  geom_point()

#Which column do you feel is better for comparison purposes, total cases 
#or TotCases/1M pop. Explain.
#Total cases per million is better for comparison as better comparison.

#Create a plot to examine the correlation between total cases and total death.
#Explain the figure.
ggplot(corona_final,aes(x=TotalCases,y=TotalDeaths))+
  geom_point()
#Create a plot to examine the correlation between total cases and Deaths/1M pop. 
#Explain the figure. Which column is more suitable to compare the result, 
#total death or Death/1Mpop?
ggplot(corona_final,aes(x=TotalCases,y=Deaths.1M.pop))+
  geom_point()
#Compare Tot Cases/1M pop by continent, and explain your result. 
corona_final  %>%
  group_by(Continent)  %>%
  na.omit(Continent)
ggplot(aes(x=Continent,y=Tot.Cases.1M.pop))+
  geom_boxplot()

#Compare Deaths/1M pop by continent, and explain your result. 
corona_final %>%
  group_by(Continent) %>%
  na.omit(Continent) %>%
  ggplot(aes(x=Continent,y=Deaths.1M.pop))+
  geom_boxplot()
  