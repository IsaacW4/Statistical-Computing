###################################################
###################################################
######## STATISTICAL COMPUTING COURSEWORK 1########
###################################################
###################################################

## 40% of the grade
## 3pm on 16th November 2020
## One written report and one .R file
## Comment throughout in a neat fortmat like so 
## Diagrams to be presented in a respectable manner
## No add-on packages within R-Studio
## All coursework carried out independently
## RENAME THE DOCUMENT 29874408.R <studentID>.R at the end
## 40 marks available 

## Diab was the test data

## This was my working directory during the coursework 
#setwd("C:/Users/Isaac/Desktop/R Code")

#######Variables##########
##########################
#preg - Number of times pregnant
#glucPlasma - glucose concentration a 2 hours in an oral glucose tolerance test
#bp - Diastolic blood pressure
#skin - Triceps skin fold thickness
#insulin - 2-Hour serum insulin
#bmi - Body mass index
#ped - Diabetes pedigree function
#age - Age
#out - Binary response variable (0 = no diabetes, 1 = diabetes)

#### Section 1 ####

### Question 1 ###
### (14 marks) ###


# originally from the US National Institute of Diabetes and Digestive and Kidney Diseases and contains measurements from n= 768
# female individuals. The data contains a series of eight measurements variables, and a 
# response variable indicating whether or not a patient has diabetes.

diab <- read.csv("C:/Users/Isaac/Desktop/R Code/diab.txt", sep="")
diab8 <- within(diab, rm(out))


#attach(diab)

# Part A # 
# (2 marks)

# 768 total patients


hasDiab <- diab$out[diab$out == "1"]
length(hasDiab)
## Hence there is 268 patients that have diabetes 

hasntDiab <- diab$out[diab$out == "0"]
length(hasntDiab)
## Hence there is 500 patients that do NOT have diabetes

PatientAge <- diab$age
median(PatientAge)
## Hence the median patient age is 29 years old

bmiDiab <- diab$bmi[diab$out == "1"]
mean(bmiDiab)
## Hence the mean BMI for patients with diabetes is 35.14254

bmiNoDiab <- diab$bmi[diab$out == "0"]
mean(bmiNoDiab)
## hence the mean BMI for patients without diabetes is 30.3042




# Part B # 
# (2 marks)

# Produce a side by side boxplot to show the distributional information of all the eight measurements 
# after scaling (subtracting the mean and dividing by the standard deviation).


## I will first implement the scaling for all of the quantities and then I will implement the plotting of the side by side plots
## This scales all of the quantities that we will be using during the plotting process
pregScaled <- (diab$preg - mean(diab$preg)) / sd(diab$preg)
glucScaled <- (diab$gluc - mean(diab$gluc)) / sd(diab$gluc)
bpScaled <- (diab$bp - mean(diab$bp)) / sd(diab$bp)
skinScaled <- (diab$skin - mean(diab$skin)) / sd(diab$skin)
insulinScaled <- (diab$insulin - mean(diab$insulin)) / sd(diab$insulin)
bmiScaled <- (diab$bmi - mean(diab$bmi)) / sd(diab$bmi)
pedScaled <- (diab$ped - mean(diab$ped)) / sd(diab$ped)
ageScaled <- (diab$age - mean(diab$age)) / sd(diab$age)
outScaled <- (diab$out - mean(diab$out)) / sd(diab$out)

?boxplot

?apply

## I first create a dataset that is the same as diab except with the "out" category removed
diab8 <- within(diab, rm(out))
## Scaling of all the measurements (By subtracting the mean and dividing by the standard deviation) 
diab.scaled <- apply(diab8, 2, scale)
## Create a vector of colours to use for each boxplot
colours <- c(rainbow(8))
## 
names1 <- c("preg", "gluc", "bp", "skin", "insulin", "bmi", "ped", "age")
## Using the boxplot function
boxplot(diab.scaled, names = names1, main = "Distributional information of all eight measurements after scaling", 
        ylab = "Scaled value", xlab = "Measurements", col = colours)
##
legend(1.5, 6.5, legend = c("preg", "gluc", "bp", "skin", "insulin", "bmi", "ped", "age"),
       col = c("red", "#FFBF00FF", "#80FF00FF", "#00FF40FF", "#00FFFFFF", "#0040FFFF", "#8000FFFF", "#FF00BFFF"), lty = 1, lwd = 5)

dev.off()

## Part C ##
# (2 marks) ##

## We know the variances of both groups and so want to use a t-test

## Null Hypothesis H_0: There is no difference between the means of the two groups

## Alternative Hypothesis H_1: There is a difference between the means of the two groups

## Separating the rows of BMI data to those that have diabetes
bmidiab <- diab$bmi[diab$out == 1]
## and for those that do not have diabetes
bmino_diab <- diab$bmi[diab$out == 0]
## Performing the t-test built into R ensuring we set Variance equal as we're told that in the question
ttest <- t.test(bmidiab, bmino_diab, var.equal = TRUE)
## Extracting the p-value from the t test
ttest$p.value
## Show all data from the t-test because I'm curious
ttest

## The p-value of the t-test is 1.229807e-16 therefore, there is sufficient evidence to reject the null hypothesis


## Part D ##
## (2 marks) ##


?df
?pf
?qf
?rf
?plot
?hist
?polygon

par(mfrow=c(2,2))

#Plot 1

## Plot an x axis for our probability density function to be plotted against 
f_dist <- seq(0,7.5, 0.001)
## Calculate the probability density function for F_{8, 10}
f_distpdf <- df(f_dist, 8, 10)
## Plotting the PDF against the sequence created
plot(f_dist, f_distpdf, main = "Probability Density Function of F_{8,10}", xlab = "x", ylab = "f(x) / Density", type = "l", col = "blue")
## Plotting a polygon and filling in colour below the graph
polygon(f_dist, f_distpdf, col = "chartreuse", border = "blue", lwd = 1.5)


#Plot 2

## Calculate the Cumulative density function, of probability for F_{8, 10}
f_distcdf <- pf(f_dist, 8, 10)
## Plotting the CDF against the sequence created
plot(f_dist, f_distcdf, main = "Cumulative Density Function of F_{8,10}", xlab = "x", ylab = "Probability", type = "l", col = "red")
## Plotting a polygon and filling in colour below the graph
#polygon(f_dist, f_distcdf, col = "pink")

#Plot 3

## Create a random set of 100 independently created numbers from F_{8, 10}
random <- rf(100, 8, 10)
## Plotting a histogram of the 100 randomly created numbers
hist(random, main = "Probability histogram of F_{8,10} random numbers",
     xlab = "F_{8,10}", ylab = "Density", col = "pink", probability = TRUE, border = "powderblue")



#Plot 4
## Compute density of the random numbers generated in previous plot
dens <- density(random)
## Plotting empirical density of the random numbers, graph should be similar to that of the histogram
plot(dens, main = "Empirical density function of F_{8, 10}", xlab = "F_{8,10}", ylab = "Density", col = "powderblue", lwd = 2)
## Plotting a polygon and filling in colour below the graph
polygon(dens, col = "pink", border = "powderblue")

dev.off()

## Part E ##
## (3 marks) ##

?apply
?cov
?solve
?cov

## Splitting the diab dataset into the 8 measurements for those with diabetes, saving them as groups
grp1 <- diab8[diab$out == 1, ]
## And for those without diabetes
grp2 <- diab8[diab$out == 0, ]

## Calculating the means of all 8 measurements for group 1 
grp1Mean <- apply(grp1, 2, mean)
## and group 2
grp2Mean <- apply(grp2, 2, mean)

## Storing the number of rows of both group 1 and group 2, should be 768 total 500 + 268
nr1 <- nrow(grp1)
nr2 <- nrow(grp2)

## Using the covariant function built into R in order to calculate the covariant matrices as defined in the question for both group 1
grp1covmat <- cov(grp1)
## and group 2
grp2covmat <- cov(grp2)



######### NOTE ############
## As using the cov() might not be allowed, I will show how I would do it without using this 

#grp1cov <- matrix(0, nr1, nr1)
#for (i in 1:nr1){
        #grp1cov <- grp1cov  + ((grp1cov[i, ] - grp1Mean) %*% t(grp1[i, ] - grp1Mean))
#}
#grp1cov <- grp1cov / (nr1 - 1)


#grp2cov <- matrix(0, nr2, nr2)
#for (i in 1:nr2){
        #grp2cov <- grp2cov  + ((grp2cov[i, ] - grp2Mean) %*% t(grp2[i, ] - grp2Mean))
#}
#grp2cov <- grp2cov / (nr2 - 1)
######## END NOTE #########



## Creating the unbiased pooled covariant matrix which is defined by group 1 and group 2 covariant matrices
covmatboth <- ((nr1-1)*grp1covmat + (nr2-1)*grp2covmat)/(nr1 + nr2 - 2)

## Difference between the group 1 and group 2 mean
meandiff <- t(as.vector(grp1Mean - grp2Mean))

## Final calculation of the Hotelling T^2 statistic as defined in the question using almost all variables previously calculated
hotellingstat <- ((nr1*nr2)/(nr1+nr2))*(meandiff %*% solve(covmatboth) %*% t(meandiff))

## Calling upon the Hotelling test statistic
hotellingstat 

## I get that hotellingstat = 333.3949 

## Part F ##
## (3 marks) ##

?pf

## Null Hypothesis H_0: For patients with and without diabetes the mean values of all measurements are equal

## Alternative Hypothesis H_1: Mean values of all measurements are not equal

## Set p to be 8 because this is the number of variables that I'm working with, 9 minus the binary out variable
p <- 8.0
## Defining m as a parameter from the previous questions variables so code looks somewhat neater
m <- nr1 + nr2 - 2
## Creating the test statistic to feed into the F distribution based off of the previous question
hotellingteststat <- ((m-p+1)/(p*m))*hotellingstat
## Cumulative distribution function, p standing for probability so that we can obtain a p-value 
pval <- pf(hotellingteststat, p, m - p + 1, lower.tail = FALSE)
## Printing p value so we can see whether to reject or accept null hypothesis, if p < 0.05 we reject
pval

## We have a p-value of 7.355568e-55 which is incredibly small and also much less than 0.05, and because of this we decide to REJECT the null hypothesis
## and state that due to the data we have found, that mean values of all measurements are NOT equal


### Question 2 ###
## (6 marks) ## 


## Part A ##
## (3 marks) ##

## Creating a matrix of everything EXCEPT the out column
x1 = as.matrix(diab8)
## Creating a matrix of only 1s matching the number of rows in x 
inter = rep(1, nrow(x1))
## Combine these 2 to create the matrix that we want to be using to calculate the matrix of coefficients
x = cbind(inter, x1)

## We need to assign K categories for this problem to represent non-diabetic, and diabetic 
## Let k = 1 be for y^1 = 1 => non-diabetic
## Let k = 2 be for y^2 = 1 => diabetic 
## Response is already stored as a 1 or 0 so we just need to extract the out column of our dataset

y2 = as.vector(diab$out)
y1 = 1 - y2
## Combine the vectors y1 and y2 to create the matrix y
y = cbind(y1, y2) 


## Fit of the linear regression model, solved by using previously calculated quantities 
yhat = x %*% solve(t(x) %*% x) %*% t(x) %*% y 
## The matrix of coefficients that we desire
bhat = solve(t(x) %*% x) %*% t(x) %*% y 
## Checking what the matrix of coefficients looks like 
bhat


## Part B ##
## (3 marks) ##

## Store all of the observations into a vector so I can easily call upon them during the next calculations
## Adding in 1s at the start to ensure dimensions match for the predictors we will be calculating
obs1 = c(1, 3, 120, 93, 26, 33, 34.9, 0.335, 30)
obs2 = c(1, 10, 180, 110, 67, 0, 58.2, 0.6, 65)
obs3 = c(1, 0, 150, 70, 60, 45, 45.3, 0.429, 58)

## Calculating the prediction classification based on the new input of the 3 new patients
predictedy1 = obs1 %*% bhat
predictedy2 = obs2 %*% bhat
predictedy3 = obs3 %*% bhat


## Calculating which columns have the highest predictor value as this will indicate what our prediction of the patient is 
which.max(predictedy1)
## 1
which.max(predictedy2)
## 2
which.max(predictedy3)
## 2

## These results imply that from the start, we assumed that y1 indicated non-diabetic patients and y2 indicated diabetic 
## patients. We have seen from above that patient 1 is predicted to be a non-diabetic patients where patients 2 and 3 are 
## predicted to be diabetic.


predictedy1
predictedy2
predictedy3 
## From the results above we see that these are reinforced as we can clearly see higher values in the respected rows
## This was used just to check that I am correct



### Section 1 Complete ###










#### Section 2 #####

### Question 1 ###
## (6 marks) ## 

## Part A ## 

## Evaluating the factorial of an input n, probably going to be using a for loop and conditional statements

calcFactorial = function(n){
        # setting a variable to 1 so that we can use it 
        fact = 1
        # Ensuring no invalid inputs can be entered 
        if (n < 0){
                message("Factorials do not exist for negative numbers")
        }else if (n == 0){
                return(1)
        }else{
                # iterating over numbers 1:n so that integers starting from 1 are multiplied together, e.g. 4! = 4*3*2*1
                for (i in 1:n){
                        fact = fact * i}
                # return the final multiplication as the answer
                return(fact)
        }
}

## Testing the function that I just wrote, e.g. 4! = 4*3*2*1 = 24 
calcFactorial(4)

## You get 24, so it's assumed this is correct

## Part B ## 

## Calculating the binomial distribution of n trials, x successes and a probability of p
## Probably going to be using loops and conditional statements again and using the function calcFactorial so not to repeat code 

binomDistr = function(n, x, p){
        # define difference
        diff = n - x 
        # calculate part 1 of equation (1)
        prob1 = (calcFactorial(n) / (calcFactorial(x) * calcFactorial(diff)))
        # calculate part 2 of equation (2)
        prob2 = p^x * (1 - p)^(n - x)
        # put it all together
        prob = prob1 * prob2
        return(prob)
}

## Testing the function 
binomDistr(n = 7, x = 3, p = 0.5)

## You should get 0.2734375, and that's exactly what I get, so also assumed correct

## Part C ## 

## The same question as part B, except now we want to implement restrictions, this is where we implement relevant condtional statements
## Just a matter of figuring out what to implement 

binomDistr1 = function(n, x, p){
        # p HAS to be between 0 and 1
        if (0 >= p | p >= 1){
                stop("The value of p must be between 0 and 1")
        # this makes sure x is an integer
        }else if (round(x) != x){
                stop("The value of x must be an integer")
        # this makes sure x is between 0 and n (inclusive)
        }else if (x < 0 | x > n){
                stop("The value of x must be an integer between 0 and n ")
        }else{
                # The repeated code from part B) 
                binomDistr(n, x, p)

                
        }
        }
        
## Test a couple of things to make sure the restrictions are working

## Test for error when x is NOT an integer
binomDistr1(n = 7, x = 3.2, p = 0.5)
## Test for error when x > n 
binomDistr1(n = 2, x = 3, p = 0.5)
## Test for error when p > 1
binomDistr1(n = 7, x = 3, p = 10)
## Test for error when p < 0
binomDistr1(n = 7, x = 3, p = -10)
## Test for an actual answer from binomdistr()
binomDistr1(n = 7, x = 3, p = 0.5)

## Restrictions are all working and the usual code works, so assumed correct




### Question 2 ###
## (8 marks) ## 


## Part A ## 

## Need to calculate equation (4) quantity, factorials are used so we can reuse caclFactorial, likely going to be using some loops again

multinomConst = function(yVec = NULL){
        n = 0 
        for (z in yVec){
                n = n + z
        }
        # set base value
        x = 1
        # need a place to stop iterating
        k = length(yVec)
        # iteration process using previous functions
        for (i in 1:k) x = x * calcFactorial(yVec[i])
        # put it all together
        v = calcFactorial(n) / x
        return(v)
}

## Lets test if we are correct using some example numbers, should get 1260

multinomConst(c(2,3,4))



## Part B ## 

multinomDistr = function(pVec = NULL, yVec = NULL){
        k = length(yVec)
        z = 1
        for (i in 1:k) z = z * (pVec[i])^(yVec[i])
        calc = multinomConst(yVec) * z 
        return(calc)
        
}


multinomDistr(pVec = c(0.7,0.15,0.15), yVec = c(20,3,4))


## Part C ## 

# Vectors p and y have the same length.
# All values of y are non-negative integers.
# All values of p are between 0 and 1, and the values in p sum up to 1.

multinomDistr1 = function(pVec = NULL, yVec = NULL){
        ## Measuring certain aspects of our vectors for conditional statements
        k = length(yVec)
        l = length(pVec)
        s = sum(pVec)
        a = min(yVec)
        if (k != l){
                ## ensuring our vectors are of same length
                stop("Vectors p and y must have the same length")
                
        }else if (any(pVec > 1)){
                ## Going through any values in pVec and making sure they're less than 1
                stop("p must be between 0 and 1")
                
        }else if (any(pVec < 0)){
                ## Going through any values in pVec and making sure they're more than 0
                stop("p must be between 0 and 1")
                
        }else if (!isTRUE(all.equal(s, 1))){
                ## Ensuring all of the values in the p vector sum to 1
                stop("p must sum up to 1")
                
        }else if (a < 0){
                ## Ensuring that all of the elements of the y vector are non negative
                stop("y must have non-negative elements")
                
        }else if (any(yVec != floor(yVec))){
                ## Ensuring that all of the elements of the y vector are integers
                stop("y must have integers")
                
        }else{
                ## Repeating the function again
                multinomDistr(pVec, yVec)

        }
        
}

## Test a couple of things to make sure the restrictions are working

## Test for error when yVec has a negative number
multinomDistr1(pVec = c(0.7,0.15,0.15), yVec = c(-20,3,4))
## Test for error when yVec has a non-integer
multinomDistr1(pVec = c(0.7,0.15,0.15), yVec = c(2.5,3,4))
## Test for error when pVec and yVec are NOT the same length
multinomDistr1(pVec = c(0.7,0.15,0.15), yVec = c(20,3,4,5))
## Test for error when pVec does NOT add up to 1
multinomDistr1(pVec = c(0.7,0.15,0.5), yVec = c(20,3,4))
## Test for error when an element of pVec is more than 1
multinomDistr1(pVec = c(0.7,0.15,10), yVec = c(20,3,4))
## Test we get an answer similar to the last function 
multinomDistr1(pVec = c(0.7,0.15,0.15), yVec = c(20,3,4))

## Restrictions are all working and the usual code works, so assumed correct



### Question 3 ###
## (6 marks) ## 

## Part A ##

piecewiseCubic = function(x){
        ## Define initial equation that appears in all 4 equations
        cubic = 2 + 1.5*x - 0.5*(x^2) + 0.25*(x^3)
        
        if (x > 3){
                ## adding each extra piece of the equation at the end
                cubic = cubic - 0.6*(x-3)
        }
        
        if (x > 5){
                ## adding each extra piece of the equation at the end
                cubic = cubic - 0.3*(x-5)
        }
        
        if (x > 8){
                ## adding each extra piece of the equation at the end
                cubic = cubic - 0.1*(x-8)
        }
        
        return(cubic)
}


piecewiseCubic(7)


## Part B ##

cubicSpline3k = function(x, betaVec, knots){
        ## Define initial equation that appears in all 4 equations
        cubic = betaVec[1] + betaVec[2]*x - betaVec[3]*(x^2) + betaVec[4]*(x^3)
        
        if (x > knots[1]){
                ## adding each extra piece of the equation at the end using an index 
                cubic = cubic - betaVec[5]*(x - knots[1])
        }
        
        if (x > knots[2]){
                ## adding each extra piece of the equation at the end using an index 
                cubic = cubic - betaVec[6]*(x - knots[2])

        }
        
        if (x > knots[3]){
                ## adding each extra piece of the equation at the end using an index 
                cubic = cubic - betaVec[7]*(x - knots[3])

        }
        
        return(cubic)
}

cubicSpline3k(7, c(2, 1.5, 0.5, 0.25, 0.6, 0.3, 0.1), c(3, 5, 8))


### Section 2 Complete ###


