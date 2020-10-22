##This is the week 4 lab sheet 2 worksheet that I will be using
##All of my solutions will be stored here
setwd("C:/Users/Isaac/Desktop/R Code")

##Question 1 
read.table("cars.txt")
cars <- read.table("cars.txt", header = FALSE)
##There are 9 columns with 398 rows
is.data.frame(cars)
##Cars is a data frame
##Renaming the columns of the data frame
colnames(cars)[1] <- "mpg" 
colnames(cars)[2] <- "cylinders" 
colnames(cars)[3] <- "displacement" 
colnames(cars)[4] <- "horsepower" 
colnames(cars)[5] <- "weight" 
colnames(cars)[6] <- "acceleration" 
colnames(cars)[7] <- "year" 
colnames(cars)[8] <- "origin" 
colnames(cars)[9] <- "name" 

attach(cars)


#1.1
plot(mpg, horsepower, main = "mpg against horsepower for cars", xlab = "Miles per gallon of a car", ylab = "Horsepower of a car")

#1.2
plot(mpg, horsepower, main = "mpg against horsepower for cars", xlab = "Miles per gallon of a car", ylab = "Horsepower of a car", col = "3")

#1.3
symbs <-c(rep(1,100),rep(5,100),rep(2,100),rep(3,98))
plot(mpg, horsepower, main = "mpg against horsepower for cars", xlab = "Miles per gallon of a car", ylab = "Horsepower of a car", col = "3", pch = symbs)

#1.4
plot(mpg, horsepower, main = "mpg against horsepower for cars", xlab = "Miles per gallon of a car", ylab = "Horsepower of a car", col = "3")
abline(h = 125, col = "red")
abline(a = 75, b = 5, col = "blue")

#1.5
plot(mpg, horsepower, main = "mpg against horsepower for cars", xlab = "Miles per gallon of a car", ylab = "Horsepower of a car", xlim = c(0,300), col = "3")
abline(h = 125, col = "red")
abline(a = 75, b = 5, col = "blue")

##This was all done the other way around to how it should have been, rearrange ASAP

##Question 2

#2.1
?pgamma
?pexp


#2.2
?plot
x <- seq(0, 4, length.out = 100)
ygam <- pgamma(x, shape = 4, rate = 2)
yexp <- pexp(x, rate = 2)
plot(x, ygam, col = "2", xlab = "x = 0 - 4", ylab = "CDF of Gamma distribution", main = "Cumalative distribution function", type = "l")
lines(x, yexp, lty = 2, col = "blue", lwd = "2")
legend(3, 0.2, lty = c(1,2), lwd = c(1,2), col = c("red", "blue"), legend = c("Gamma (shape 4, rate 2)", "Exponential (rate 2"))

#2.3
par(mfrow =c(2,1))
x <- seq(0, 4, length.out = 100)
ygam <- pgamma(x, shape = 4, rate = 2)
yexp <- pexp(x, rate = 2)
plot(x, ygam, col = "2", xlab = "x = 0 - 4", ylab = "CDF of Gamma distribution", main = "Cumalative distribution function", type = "l")
plot(x, yexp, lty = 2, col = "blue", lwd = "2", xlab = "x = 0 - 4", ylab = "CDF of Exponential", main = "Cumalative distribution function", type = "l")
legend(3, 0.6, lty = c(1,2), lwd = c(1,2), col = c("red", "blue"), legend = c("Gamma (shape 4, rate 2)", "Exponential (rate 2"))

dev.off()


##Question 3

#3.1
?hist
hist(weight, probability = TRUE, main = "Probability of weight in cars dataset", col = "cyan", border = "red")

#3.2
d <-density(weight)
plot(d, main="Empirical Density of Weight")
polygon(d, col="pink", border="blue")

#Adding onto plot 3.1
hist(weight, probability = TRUE, main = "Probability of weight in cars dataset", col = "cyan", border = "red")
d <-density(weight)
lines(d, main="Empirical Density of Weight")
polygon(d, border="blue", col=rgb(1, 0.6, 0,0.5))
?polygon

#3.3
qqnorm(weight)
qqline(weight, col = "steelblue", lwd = 2)

#3.4
?lm
fit <- lm(mpg ~ weight, data = cars)
plot(weight, mpg, main = "scatter plot of linear regression of mpg ~ weight", xlab = "weight", ylab = "mpg")
abline(a = fit$coef[1], b = fit$coef[2], col = "cyan")


##To be used for the Quiz 2
x = seq(0, 5, length.out = 100)
y = seq(0, 3, length.out = 100)
plot(x, y, type = "s")
plot(x,y)
?plot

#1 
#plot(a,b)

#2
#abline

#3
#143

#4
?par
#par(mfrow = c(6, 6), cex = 0.9, las = 2, bty = "n")





