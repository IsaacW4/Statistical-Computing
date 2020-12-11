print("Hello World")

#----- Math Operators ----
2+2
2+2 
6-3+2 
3*4
4/2     #divide
log(10) #log
exp(3)  #exponential
2^3     #power
sqrt(1.5) #square root


#----- vector and matrix ----
c(1, 2, 3, 4, 5, 6)
c(1:6)
c(1:100)

#1-6 in 2 *3 Matrix, arranged by row
matrix(1:6, nrow=2, ncol=3, byrow=TRUE) 

#1-6 in 2 *3 Matrix, arranged by column
matrix(1:6, nrow=2, ncol=3, byrow=FALSE)


#-------Write a comment------

# This is a comment that will not be run
matrix(1:6, nrow=2, ncol=3, byrow=TRUE) # matrix by row 
matrix(1:6, nrow=2, ncol=3, byrow=FALSE) # matrix by column


#----- Help files in R------
help(matrix) 
help(c) 
help(print) 
?matrix


#----- Assign An Object ----
a <- 4
a
a <- 2 + 2
a
2+2 -> a
a
A <- 14
A

#----Generate Random Numbers-----

rnorm(1) # One random number from N(0,1)
rnorm(10)
rnorm(10, mean=2, sd=3) ## Ten random number from N(2,9)

help(rnorm)

runif(1) # One random number from Unif(0,1)
runif(10)
runif(10, min=2, max=3) # Ten random number from Unif(2,3)


#--------Summary of large vectors and matrices----
a <- rnorm(100000)  # Vector of 10000 random numbers from N(0,1)

head(a) #show first 6 elements of a
tail(a) #show last 6 elements of a
head(a, n=10L) #show first 10 elements of a


b <- matrix(rnorm(10000), nrow=100) # 100 * 100 matrix

head(b)  #show first 6 rows of b

summary(a) #show summary statistics of a
summary(b) #show summary statistics of each column in b


#--------- Load Pokemon Dataset----------------
help(read.csv)

# Load your data
# Note here you need to specify the location of your Pokemon.csv in your computer
# by entering file="". It might be different if you store this csv file in another folder!!!
pokemon <- read.csv(file="C:/Users/Isaac/Desktop/R Code/Pokemon.csv", header=TRUE)


# Summary the pokemon dataset
head(pokemon)
str(pokemon)
summary(pokemon)

#Assigns values of the dataset
pokemon$Pokemon
pokemon$HP

#Assigning values of the dataset as their own. e.g. Names = name of all pokemon in a row
Names <- pokemon$Pokemon
HP <- pokemon$HP
Atk <- pokemon$Atk
SA <- pokemon$SA
Total <- pokemon$Total

#Reads value of 5th row and 3rd column of the dataset
pokemon[5, 3]
#Gives entire row leaving the column blank
pokemon[5, ]
#Gives entire column leaving row blank
pokemon[ ,3]

#Searches for first 10 pokemon in the data and shows 3rd to 5th column
pokemon[1:10, 3:5]
#Gives 2nd, 4th and 8th pokemon with the 3rd, 4th and 5th column
pokemon[c(2,4,8), c(3,4,5)]
#Same thing
pokemon[c(2,4,8), 3:5]

#Lets find the pokemon with the highest HP, Atk and Total
Names[which.max(HP)]
Names[which.max(Atk)]
Names[which.max(Total)]

#Gives raw value of HP
max(HP)
#Gives the index value of the entry with max HP
which.max(HP)
#Same thing
max(Atk)
which.max(Atk)
#Same thing
max(Total)
which.max(Total)

#Searches for a pokemon in the dataset (of names)
"Pikachu" %in% Names
"David" %in% Names

#Creates a vector of TRUE and FALSE where it compares "pikachu" to the names of all pokemon
Names == "Pikachu"
#Returns index where this is TRUE only
which(Names == "Pikachu")
#Verify that this is correct
pokemon[25, ]

pokemon$Type.I

#Same as above, except it's not being assigned
Type.I <- factor(pokemon$Type.I)
Type.I

#Shows different levels of the dataset, e.g. shows pokemon types
levels(Type.I)
#Shows a table of numerical values of all the pokemon types
table(Type.I)
#Plots a histogram of all of the data of pokemon types
plot(Type.I)

#We can now also start to plot the types against different attributes of the data
plot(Type.I, HP, ylab = "HP")
plot(Type.I, Atk, ylab = "Attack")
plot(Type.I, Total, ylab = "Total score")

#Now lets compare two different types of Pokemon based upon their HP 
pokemon[Type.I == "Normal", ]
pokemon[Type.I == "Normal", "HP"]
pokemon[Type.I == "Water", "HP"]
#HP value of pokemon with Normal type
normal <- pokemon[Type.I == "Normal", "HP"]
water <- pokemon[Type.I == "Water", "HP"]

mean(normal)


#We reject H_0 as p value is 0.2119 so there is no significant evidence to suggest the mean HP for normal and water pokemon is different
t.test(normal, water)

#Model relationship between the Attack and Special Attack of pokemon, using linear regression 
reg <- lm(SA ~ Atk, data = pokemon)
#First value is B0 and second is B1
reg
#Scatter plot of Atk against SA
plot(Atk, SA)
#Plot linear regression curve between Atk and SA
abline(reg$coef[1], reg$coef[2], col = "red", lwd = 3)

#ANALYSIS DONE

#My code
gdp <- read.csv(file="C:/Users/Isaac/Desktop/R Code/Datasets/gdpgrowth.csv", header=TRUE, sep=".")


summary(gdp)
