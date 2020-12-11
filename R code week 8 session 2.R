## R code to be used for the week 8 lecture 2

## Inverse transformation sampling doesn't always work and we need to implement other methods 
## A-R sampling is one way in which we can overcome this
## Accept - Reject sampling gives us a solution to simulating difficult distributions 

## Dates back to Buffons needle problem 

## Fundamental theorem of simulation


## A-R Sampling algorithm 

## 1.We can generate random numbers from some very complicated target pdf π(x) even if p(x)is simple.

## 2.The computational cost for this algorithm depends on the acceptance probability P(y≤π(x)Mp(x))=1M, which we want it to be as large as possible 
## in simulations. This means that we need to choose p(x) properly, and therefore can pick M small.

## 3.The distribution of the random numbers generated from A-R sampling is exactly (NOT approximately)π(x).
## 4.The algorithm can be extended to multivariate random number generation


## For example, suppose pdf π(x)has support(a,b)and is uniformly bounded by M.We can simulate the random pair(Y,U)∼Unif(0<u<M).
## This can be done by simulating Y∼Unif(a,b) and U|(Y=y)∼Unif(0,M).Next, we take the subset of pairs into our samples only i
## f the constraint 0<u<π(y)is satisfied. This subset should follow the joint distribution of Unif{(y,u) : 0<u<π(y)}


## Generating beta(a,b)

#-----Example 3.2: Generating Beta(a, b)---------------

r.mybeta <- function(n, a, b){
  ## This function is for generating a sample of n
  ## observations from Beta(a,b) distribution with the ## restriction that a >=1 and b>=1.
  X <- NULL
  for(i in 1:n) {
    repeat { x <- runif(1) 
    y <- runif(1)
    if(y <= x^(a-1)*(1-x)^(b-1)) {
      X[i] <- x
      break }
    }
  } 
  return(X)
}



set.seed(2020)
mysample <- r.mybeta(n=1000, a=2, b=3) #generate 1000 random samples

# plot the ecdf and compare to the beta density
plot(density(mysample),lwd=2, main=" Simulated and actual pdf of Beta(2,3)" )
curve(dbeta(x,2,3),from=0,to=1, add=T, lwd=1.5, lty=3)
legend(x=0.8, y=1.5, legend=c("Simulated pdf", "Actual pdf"),
       lty=c(1,3), cex=0.6)

?dbeta


## 1 draw X=x from p;
## 2 draw Y=y from Unif(0,1);
## 3 if y≤π(x)Mp(x) then accept X=x as a sample from ;
## else
## reject X=x
## end


## Algorithm for 3.2

## 1 draw X=x from Unif(0,1);
## 2 draw Y=y from Unif(0, 1) independently from X
## 3 if y≤x^(a−1)(1−x)^(b−1), acceptX=x;
## otherwise reject


## Generating N(0,1) 

## Derive an A-R sampling algorithm for generating random numbers from N(0,1) from a double exponential distribution

#------------Example 3.3 Generating N(0,1)--------------------------------   

r.mynormal <- function(n, lambda){
  ## This function is for generating a sample of n ## observations from N(0,1)
  X <- NULL
  for(i in 1:n) {
    repeat { u <- runif(1) 
    if (u<=0.5){
      x <- lambda^(-1)*log(2*u) 
    }else{
      x <- -lambda^(-1)*log(2-2*u)
    }
    y <- runif(1)
    if (y <= exp(-(abs(x)-lambda)^2/2)) { 
      X[i] <- x
      break} 
    }
  }
  return(X)
}


set.seed(2020)
mysample <- r.mynormal(n=2000, lambda=1) #genertate 2000 random samples

# plot the ecdf and compare to the normal density 
plot(density(mysample),lwd=2, main=" Simulated and actual
      pdf of N(0,1)" )
curve(dnorm(x), add=T, lwd=2, lty=3, col="red") 
legend(x=2, y=0.4, legend=c("Simulated pdf", "Actual pdf"), 
       lty=c(1,3), cex=0.6)


#  ----------Efficiency of Example 3.2 --------------------

## Same as the previous mybeta function except we can now check the efficiency of the program

r.mybeta1 <- function(n, a, b){
  ## This function is for generating a sample of n
  ## observations from Beta(a,b) distribution with the ## restriction that a >=1 and b>=1.
  X <- NULL
  count <- 0 ## count the number of total samples
  for(i in 1:n) {
    repeat { x <- runif(1) 
    y <- runif(1)
    count <- count + 1
    if(y <= x^(a-1)*(1-x)^(b-1)) {
      X[i] <- x
      break }
    }
  } 
  return(list(X=X, count=count))
}

set.seed(2020)
totalsamples <- r.mybeta1(n=1000, a=2, b=3)$count
totalsamples

## Total samples is 12311 within which we only acept 1000 to generate the target dist

## 1/M = 1/12 so this checks out as 1000/12000






## To be used for Quiz this week 

## Question 1

## If a random variable U follows the uniform distribution on [0,1],  Let X= - log (U)/2, what is the distribution of X?

## A. Exponential distribution with mean equal to 2

## Question 2

## In Example 3.2 of lecture 2, we are using A-R sampling to generate random numbers from Beta distribution. If I change the Algorithm Ex 3.2 as follows:

## It's either 

## C.Beta(a, b) or

## D.Beta(a/3, b/3)











