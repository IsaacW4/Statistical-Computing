##Question 1
##Set working directory
setwd("C:/Users/Isaac/Desktop/R Code")
##Dataset imported
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

##Creating a new column for a new datapoint
cars$PowerWeight <- (cars$horsepower / cars$weight)
##Median of new datapoint
median(cars$PowerWeight)
#Deleting datapoint again
cars$PowerWeight <- NULL

##Attach the dataset
attach(cars)

##Question 2
##Mean value of miles per gallon (mpg) for the cars that are in model year 70?
mean(cars$mpg[cars$year == "70"])
sd(cars$mpg[cars$weight > 3000 & cars$weight < 4000])

##What is Origin
is.factor(origin)
is.numeric(origin)
##Origin is a numerical value
##Let's change that
as.factor(origin)

origin <- as.factor(origin)


##Cutting the cars into different categories
cars$acc.cut<-cut(cars$acceleration,
                       breaks =c(0, 15, 30),#cutpoints
                       labels=c("slow", "fast")
)

##Question 3
## Students 2 sample t test

x1 <- cars$mpg[cars$year == "70"]
x2 <- cars$mpg[cars$year == "71"]
t.test(x1, x2, var.equal = TRUE)

##P value of the test = 0.02884 which is lower than 0.05 so we REJECT the null hypothesis at this level

##Fit a multiple linear regression model
reg <- lm(cars$mpg ~ cars$horsepower + cars$weight)
##Gives a summary of the model 
summary(reg)


