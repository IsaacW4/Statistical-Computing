###################################################
###################################################
######## STATISTICAL COMPUTING COURSEWORK 2########
###################################################
###################################################

## 40% of the grade
## 3pm on 18th January 2021
## One written report and one .R file
## Comment throughout in a neat fortmat like so 
## Diagrams to be presented in a respectable manner
## No add-on packages within R-Studio
## All coursework carried out independently
## RENAME THE DOCUMENT 29874408.R <studentID>.R at the end
## 40 marks available 


## This was my working directory during the coursework 
#setwd("C:/Users/Isaac/Desktop/R Code")
setwd("C:/Users/Isaac/Desktop/R Code")


## Dataset is daytimeSleepHours.txt 

daytimeSleepHours <- read.csv("C:/Users/Isaac/Desktop/R Code/daytimeSleepHours.txt", sep="")
View(daytimeSleepHours)




#### Section 1 ####
### Monte Carlo Stats methods ###

### Question 1 ###
### Inverse transformation and Gibbs sampler ###
### (7 marks) ###

# Part A #
# (1 mark) # 

## Sheet attached


# Part B #
# (2 marks) # 

## Sheet attached

# Part C #
# (1 mark) # 

r.myConditional = function(con){
  u <- runif(1)
  sample <- u*(con+1.5) - con - 1
  return(sample)
}

## Negative values obtained, needs a change 
r.myConditional(1)


# Part D #
# (2 marks) # 



# Part E #
# (1 mark) # 



### Question 2 ###
### A-R, Importance and M-H sampling ###
### (9 marks) ###



# Part A #
# (3 marks) # 




# Part B #
# (3 marks) # 


# Part C #
# (3 marks) # 



### Question 3 ###
### Sampling N(0,1) pairs ###
### (4 marks) ###


# Part A #
# (2 marks) # 


# Part B #
# (1 mark) # 



# Part C #
# (1 mark) # 


#### Section 2 ####
### EM algorithm and bootstrapping ###

### Question 1 ###
### Mixture of Gaussian distributions ###
### (13 marks) ###




# Part A #
# (4 marks) # 



# Part B #
# (4 marks) # 


# Part C #
# (2 marks) # 


# Part D #
# (3 marks) # 


### Question 2 ###
### Applic. of Est. Parameters of a Gaussian mixture with an EM Algorithm ###
### (3 marks) ###







### Question 3 ###
### Bootstrapping for the Cov Coeff. of a simple logistic regression 
### (4 marks) ###































