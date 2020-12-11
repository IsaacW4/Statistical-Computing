## To be used for the lab session 1 of R programming II

setwd("C:/Users/Isaac/Desktop/R Code")

advert.df =read.csv("Advertising.csv", header = T, row.names = 1)

head(advert.df)
dim(advert.df)


attach(advert.df)

## Start of exercise questions

## Question 0 

# a)

calcLogXP1Trans =function(x = NULL) {
  newX =log(x+1)
  return(newX)
}

# b) 

intVals =c(7, 5, 3, 10, 7, 0, 3, 2, 9, 2)
logXP1Vals = calcLogXP1Trans(intVals)
logXP1Vals[3]

## Question 1 

# a) 
?qnorm

calcNormalise = function(x = NULL) {
  y = mean(x)
  z = sd(x)
  newX = (x - y)/z
  return(newX)
}


# b)
vals = c(7, 5, 3, 10, 7, 0, 3, 2, 9, 2)
vals[1]
normvals = calcNormalise(vals)

# c)
normvals[5]


## Question 2 

# a) 

calc0to1scaling = function(x = NULL) {
  y = min(x)
  z = max(x)
  ranger = z - y 
  scal = (x - y) / ranger
  return(scal)
}

# b) 

vals = c(7, 5, 3, 11, 7, 1, 3, 2, 9, 2)
scalvals = calc0to1scaling(vals)

# c)

scalvals[8]

## Question 3 

# a)

matrixMultiply = function(matA = NULL, matB = NULL) {
  
matmulti = matA %*% matB
return(matmulti)
}


matA <- matrix(c(8, 1, 2, 4, 3, 6, 7, 5, 9, 2, 2, 0), nrow = 4, ncol = 3, byrow = TRUE)
matA

matB <- matrix(c(2, 1, 2, 0, 1, 2), nrow = 3, ncol = 2, byrow = TRUE)
matB

matrixMultiply(matA, matB)


## Question 4

## Part A 

## a) i)

## Starting of the function


calcCoefMLE = function(y = NULL, x = NULL) {
  ## We need to solve the following equation
  XTX = t(x) %*% x
  B = solve(XTX) %*% (t(x) %*% y) ## solve() inverts the matrix given
  B = as.vector(B) ## Ensures that B is a vector
  names(B) = colnames(B) ## Sets names as usual
  return(B) ## Returns the output
}

## a) ii) 

?data.frame
## Creates a data frame for the equation given
advertDesign.df = data.frame(intercept = rep(1, nrow(advert.df)), advert.df[, c("TV", "radio", "newspaper")])

## Transforms the data frame into a matrix so that we can use it in our equation created previously 
advert.mat = data.matrix(advertDesign.df)

## Calls upon the equation we created prior
advertCoefMLE = calcCoefMLE(sales, advert.mat)

advertCoefMLE


## a) iii) 

## [1]  2.938889369  0.045764645  0.188530017 -0.001037493

## b) i) 

calcFittedY = function(matX = NULL, vecB = NULL) { 
  yhat = matX %*% vecB
  return(yhat)
}

## b) ii)

calcFittedY(advert.mat, advertCoefMLE)
calcFittedY()

## b) iii) 

## 13th = 10.577, 21st = 18.101, 34th = 18.864

## c) i) 

advertFittedY = calcFittedY(advert.mat, advertCoefMLE)

calcRes = function(vecY = NULL, vecZ = NULL) {
  vecU = vecY - vecZ 
  vecU = as.vector(vecU)
  return(vecU)
}

Res = calcRes(sales, advertFittedY)
Res[c(55, 89, 144)]

## d) i)

calcLinReg = function(vecY = NULL, matX = NULL) {
  advertCoefMLE = calcCoefMLE(vecY, matX)
  advertFittedY = calcFittedY(matX, advertCoefMLE)
  Res = calcRes(vecY, advertFittedY)
  LinRegList = list(coef = advertCoefMLE, fitted = advertFittedY, residuals = Res)
  return(LinRegList)
}

AdvLinRegList = calcLinReg(sales, advert.mat)

## Let us check that the values are the same for the function above 

all(AdvLinRegList$coef == advertCoefMLE)

all(AdvLinRegList$fitted == advertFittedY)

all(AdvLinRegList$residuals == Res)

