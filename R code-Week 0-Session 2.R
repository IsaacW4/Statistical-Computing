#Say we want to generate random numbers without running the usual runif command, 1000 random numbers from Unif(2,3), between 2 and 3, lets write our own script

#Initialisation (Use default values of M, a and b)
M <- 2^32
a <- 1103515245
b <- 12345

X0 <- 2020 #Fixed random seed

#Between 2 and 3
c1 <- 2
c2 <- 3

#Generate 1000 pseudo random numbers
X <- c(1:1000) #Initialisation
for (i in 1:1000) { #for loop 
  if (i==1) {
    X[i] <- (a*X0 + b) %% M 
  }else
    X[i] <- (a*X[i-1] + b) %% M
}

Y <- X/M
Z <- c1 + Y 

X

c(1:1000) #creates a list of numbers from 1 to 1000