#Q1.
# Are agreeing with the statement "Men should have more right to a job than women"
#and having a university degree or higher disjoint events?

#No, there are not disjoint events. They are dependent on each other.

#Q3.
# What is the probability that a randomly drawn person has a university degree or
#higher or agrees with the statement about men having more right to a job thanwomen?

#p(A U B)=P(A)+P(B)-P(A and B)
#P(A)=0.138
#P(B)=0.362
#P(A and B)=0.036
#P(A U B)=0.138+0.362-0.036
#P(A U B)=0.464

#Q4.
#What percent of the world population do not have a university degree and disagree 
#with the statement about men having more right to a job than women?
The percentage of people agreeing with the statement= 36.2%
The percentage of people who have a degree or higher one=13.8%
People who dont have auniversity degree=100-13.8=86.2
people who dont agree with the statement=86.2-36.2=50

#Q5.
# Does it appear that the event that someone agrees with the statement is 
#independent of the event that they have a university degree or higher?
No they are dependent on each other.

#Question 2: According to a 2013 Gallup poll, worldwide only 13% of employees are
#engaged at work (psychologically committed to their jobs and likely to be making
#positive contributions to their organizations). Among a random sample of 10 employees, what is the probability that 8 of them are engaged at work?

We use bernoullis theroem to solve this.
here n=10
     k=8
     p(Engaged in work)=0.13
     p(Not engaged in work)=0.87
using binomial distribution  we get
0.00000278

We can also use the dbinom()function r
dbinom(8, size = 10, p = 0.13)

#Question 4: According to a 2014 Gallup poll, 56% of uninsured Americans who plan
#to get health insurance say they will do so through a government health insurance 
#exchange. What is the probability that in a random sample of 10 people exactly 6
#plan to get health insurance through a government health insurance exchange?

using binomial distribution=0.243

by using dbinom()in r we get
dbinom(6, size = 10, p = 0.56)


