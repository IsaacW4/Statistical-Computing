# ----------------------------------------------------     
#   Part 2: a guided tour of R for data analysis
#-----------------------------------------------------
#Load the Dataset
help(read.csv)
pokemon <- read.csv(file="Desktop/Pokemon.csv", head=TRUE) 

#see summary informtion
head(pokemon) 
str(pokemon)
summary(pokemon)

#-----visit variables and elements----------
pokemon$Pokemon
pokemon$HP

Names <- pokemon$Pokemon #name of pokemons
HP <- pokemon$HP    #health point
Atk <- pokemon$Atk #attack
SA <- pokemon$SA   #special attack
Total <- pokemon$Total  #total score

pokemon[5, 3]  
pokemon[5, ]
pokemon[, 3]

pokemon[1:10, 3:5] 
pokemon[c(2,4,8), c(3,4,5)]

#--------Find the best pokemon-----------------

max(HP)          #find the maximum value in the vector HP
which.max(HP)    #find the index of the maximum value in vector HP

Names[which.max(HP)] #show the name of pokemon with the maximum HP value
Names[which.max(Atk)] #show the name of pokemon with the maximum Attack value
Names[which.max(Total)] #show the name of pokemon with the maximum total score


#--------Location Pikachu---------------------

"Pikachu" %in% Names  # check if Pikachu is in the dataset
"David" %in% Names  # check if David is in the dataset

1==1
2==1

Names == "Pikachu" # show if each elements of Names is equal to Pikachu
which(Names == "Pikachu") # show which element of Names is equal to Pikachu

pokemon[25, ] 

#---------stury the primary pype--------------

pokemon$Type.I # Primary type of pokemons

Type.I <- factor(pokemon$Type.I) # encode Type.I as a categorical vector
Type.I
levels(Type.I) # show how many categories in Type.I

table(Type.I) # show the information of each category in Type.I
plot(Type.I) # show the information of each category in Type.I

#---------Plot the HP/Atk/Total by primary types------------

plot(Type.I, HP, ylab="HP")
plot(Type.I, Atk, ylab="Attack")
plot(Type.I, Total, ylab="Total Scores")

#----------two sample test for Normal and Water pokemon---------

pokemon[Type.I=="Normal",] #a sub-dataset with only Normal type pokemons

normal <- pokemon[Type.I=="Normal", "HP"] #HP of Normal type pokemons
water <- pokemon[Type.I=="Water", "HP"]  #HP of Water type pokemons

t.test(normal, water) # run two sample t-test 

#---------Linear regression for Atk versus SA--------------------

reg <- lm( SA ~ Atk, data =pokemon) # run regression, SA as response and Atk as regressor  

plot(Atk, SA) #scatter plot of Atk versus SA
abline(reg$coefficients[1], reg$coefficients[2], col="red") #show the fitted model

summary(reg) #summary information of regression

# ----------------------------------------------------     
#   Part 3: a R for statistical computing
#-----------------------------------------------------
#The following code gives an example of (pseudo-)random number generator 
#The method for generate random numbers is Linear Congruential Algorithm

# Initialisation
M <- 2^32
a <- 1103515245 
b <- 12345
X0 <- 2020 ## fix random seed 
c1 <- 2
c2 <- 3
## Generate 1000 pseudo-random numbers 
X <- c(1:1000) ## Initialisation 

for (i in 1: 1000){ # for loop to generate uinform random integers
if (i==1){
  X[i] <- (a*X0 +b) %% M
}else
  X[i] <- (a*X[i-1] +b) %% M
}
Y <- X/M  #Unif(0,1)
Z <- c1+Y #Unif(2,3)
       