##Solutions for my workings in the computer lab

##Question 1
##1.1 
#Value Question
sin(pi/2) + exp(2.5)
##1.2
#Value Question
(2.6)^(9) - (2.9)^(6)
##1.3
#Value Question
(997 - 243)/6 + 4*((93/2.5) - 6)

##Question 2
##2.1
##Help file functions
?qnorm
?dnorm
?pnorm
?rnorm
##2.2
## What is the 97.5% quantile of the standard normal distribution N(0,1)?
qnorm(0.975)
##2.3
## What is the value of probability P(X >2)if X follows a normal distribution with mean 0 and variance equals to 4?
##The reason it is 1 - Ans, is because P(X<2) is what we calculate and we wanted P(X>2) instead, and so we get that by doing 1 - Ans
1 - pnorm(2, mean = 0, sd = 2)
##2.4
##Let X follows a normal distribution with mean 0 and variance equals to 4. What is the value of its probability density function f(x) at x = 2.3?
dnorm(2.3, mean = 0, sd = 2)
##2.5
##If you want to know the 10%, 20%, 30%, 40%, 50%, 60%, 70%, 80% and 90% quantiles of standard normal distribution, can you get the answers in one line of R command?
qnorm(c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9))

##Question 3
##3.1
## Create a folder on the desktop of your computer, name it "Statistical Computing" (your do not need tocomplete this step in R and
##Set your working directory to this folder in RStudio.
Done

##3.2
x <- matrix(1:30, ncol = 10, byrow = TRUE)
x

##3.3
App <- c("TikTok", "WhatsApp", "Instagram")
Owner <- c("ByteDance", "Facebook", "Facebook")
Size <- c(55.21, 132.4, 145.7)
is.numeric(Size) 

##3.4
as.character(Size)

##3.5
y <- data.frame(App, Owner, Size)
y

##3.6
save(x, y, file = "week2-lab2.RData")
setwd("C:/Users/Isaac/Desktop/R Code/Statistical Computing")

##Question 4
##4.1
x[3, 4]
x[1, ]
x[, 7]
x[2, c(4,5,6,9)]

##4.2
y[, 2]
y[1,3]
y[c(1,3), 2]

##4.3
x1 <- x[2,]
x1[x1 > 15.5]

##4.4
Saved