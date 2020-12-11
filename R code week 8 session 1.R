## R code to be used for the week 8 lecture 1

## Part 3 Monte Carlo methods 

## This part of the module focuses on implementing algorithms within R and has a harder focus
## on statistical methods than the previous parts so a deeper understanding of stats is needed


## Monte Carlo Integration 
## Strong law of large numbers
## Central limit theorem 

## 2 pillars of statistics

# Sample mean converges almost surely to the true mean

# Normalized sum converges to a normal distribution regardless of the original distribution of X_i 

## What is Monte Carlo? 

# Monte Carlo methods are computational algorithms that rely on repeated random sampling to obtain numerical results. 
# Use randomness to solve problems that are deterministic 

## https://rpubs.com/jt_rpubs/279263
## Blackjack simulation


## Computationally Monte Carlo methods are very efficient even when the dimension of the problem is very high


## Random number generation for Monte Carlo methods

n<-1000
##Generate random numbers from Standard Normal
rnorm(n)
##Generate random numbers from N(3,4)
rnorm(n,mean=3,sd=2)
##Generate random numbers from Student's t-distribution
##with degree of freedom equal to 5
rt(n,df=5)

## Is random number generation really random?

## Pseudo random number generation depends on the generation of uniformly distributed random numbers

## A computer is an entirely deterministic machine, thus cannot by itself generate random numbers in the real 
## probabilistic sense.However it can generate deterministic sequences that behave just like random sequences
## Those numbers are called pseudo-random numbers, because they try to mimic randomness.




## Generating Pseudo random numbers

## 1. Linear Congruential generator

##Initialisation

M<-2^32; 
a<-1103515245; 
b<-12345
##fix random seed
X0<-2020

##Generate2000pseudo-randomnumbers

X<-NULL 
for (i in 1: 2000){
  if (i==1){
    X[i] <- (a*X0 +b) %% M
    }else X[i]<-(a*X[i-1] +b) %% M
  
    }
Y<-X/M

##plot the random numbers
par(mfrow=c(1,2)) ##multiple plot
plot(x=c(1:2000),y=Y, type="p", pch=16, cex=0.3, 
     xlab="Iterations")##plot Y against n
hist(Y,col="pink", border ="red", prob =TRUE,main="")##plot histgram of Y 
lines(density(Y),lwd=2)
      
      
      
      
## Reproduce the same sequence of 10 random numbers 
set.seed(2020)
u1 <- rnorm(10)
u1

set.seed(2020)
u2 <- rnorm(10)
u2
      


## very useful for reproducability of experiments on other computers

   
## Inverse transformation sampling  

## Generating Exponential Distribution 

      
r.myexp<-function(n, lambda){
  ##Thisfunctionisforgeneratingasampleofn
  ##observationsfromExp(lambda)distribution.
  X <- NULL
  for(i in 1:n) {
    u <- runif(1)
    x <- -(log(1-u)/lambda)
    X[i] <- x  
    
    }
  
  return(X)
  
}


dev.off()

set.seed(2020) ##fixrandomseed
mysample <- r.myexp(n=1000, lambda=4)

plot(density(mysample), lwd=2, main="Simulated and actual pdfs of Exp(4) ")
curve(dexp(x,rate=4), from=0,add=T, lwd=2, lty=3,col="red")
legend(x=1.5, y=2,legend=c("Simulatedpdf","Actualpdf"), lty=c(1,3),col=c("black","red"), cex=0.6)

















      
      
      

