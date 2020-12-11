## R code for week 6 session 1

## R uses functions as tiny little environments that run in their own space
## The global space is when you're not within a function

x = 2
y = 3
2*x + y 

ex4 = function(ashtray, hairdryer){
  rating = ashtray + hairdryer
  return(rating)
}

ashtray = 7


ex5 = function(hairdryer){
  rating = ashtray + hairdryer
  return(rating)
}


## Can use functions to plot graphs aswell

ex6 = function(xVals){
  yVals = xVals^2
  plot(xVals, yVals, type = "l",
       xlab = "x values", ylab = "y values",
       main = expression(y~"="~x^"2"))
  
}

x = seq(-1,1, by = 0.01)
ex6(x)

x = seq(-0.5, 2.5, by = 0.01)
ex6(x)


## Control flow overviews
## If statements and loops essentially is what we're trying to get at here

## The most basic of if statements within R

x = 1
y = NA
if (x < 2){
  y = x + 2
}
y

## Another simple loop with a slight twist

x = 1
z = NA
if (x > 2){
  z = x + 2
}
z

## We can also perform if - else statements which allow for multiple conditions to be met

x = 1
y = 0
if (x < 2) {
  y = x + 2
} else {
  y = x -3
}
y

## Another example
x = 1
z = 0
if (x > 2) {
  z = x + 2
} else {
  z = x -3
}
z

## The ACTUAL ifelse() function has 3 returns which is test, yes and no. 
## Test returns true or flase
## Yes is run when test is true
## no is run when test is false

x = 1
y = ifelse(x < 5, 777, "cat")
y

## Another example

x = 1
z = ifelse(x > 5, 777, "cat")
z



## There exists an if else if statement aswell 
p = 0.01 
msg = NA 
if(p < 0.025){
  msg = "Unusually small"
  }else if(p > 0.975){
    msg = "Unusually large"
    }
msg

## Another example

p = 0.99
msg = NA 
if(p < 0.025){
  msg = "Unusually small"
}else if(p > 0.975){
  msg = "Unusually large"
}
msg

## Another example

p = 0.6
msg = NA 
if(p < 0.025){
  msg = "Unusually small"
}else if(p > 0.975){
  msg = "Unusually large"
}
msg

## Can have more than one if else if statement

p = 0.6
msg = NA 
if(p < 0.025){
  msg = "Unusually small"
}else if(p > 0.975){
  msg = "Unusually large"
}else{
  msg = "nothing unusual"
}
msg




