## Week 5 lab 2 session 

## Set working directory 
setwd("C:/Users/Isaac/Desktop/R Code")


## Question 1 - Geometric series

## 1) a) 

calcFiniteGeo = function(a = NULL, r = NULL, n = NULL) {
  x = 0
  for(i in 1:n) x = x + a*r^(i-1)
  return(x)
}

## 1) b) 

calcFiniteGeo(0.5, 2, 5)

## Question 2 

pgeom(q = 7 - 1, prob = 0.75)

## <----> These are both equivalent and are calculated using the geometric series

calcFiniteGeo(0.75, 0.25, 7)

## Question 3 

calcHn = function(n = NULL) {
  x = 0
  for(i in 1:n) x = x + 1/i
  return(x)
}

## b)

calcHn(5)

## I am correct

## Question 4 

harmonicMean = function(vecY = NULL) {
  n = length(vecY)
  x = 0
  for(i in 1:n) x = x + (1 / vecY[i])
  H = n / x 
  return(H)
  
}

harmonicMean(c(5.8, 7.2, 3.6, 1.1, 6.2))

vecY = c(5.8, 7.2, 3.6, 1.1, 6.2)
length(vecY)
sum(vecY)



## To be used for the quiz 

## Question 1 

## Statements a, b and d are part of the recommended guidelines for good programming practices.

## Question 2 

calcPower = function(x, y){
  
  result = x^y
  
  return(result)
  
}

calcPower(1,2)
calcPower(2,1)

## False - These are not the same













