## R code to be used in week 9 session 1
## Envelope AR sampling and Importance Sampling


## Envelope AR Sampling

#------Example 3.4 N(0,1) Using Envelope A-R Sampling-------------------------------
r.mynormal.evenlope <- function(n, lambda){
  ## This function is for generating a sample of n
  ## observations from N(0,1) using Envelope A-R
  X <- NULL 
  for(i in 1:n) {
    repeat { u <- runif(1) # Step 1. generate x from L(lambda)
    if (u<=0.5){  # inverse transformation algorithm
      x <- lambda^(-1)*log(2*u)
    } else{
      x <- -lambda^(-1)*log(2-2*u)}  
    y <- runif(1) # Step 2. generate y from Unif(0,1)
    #Step 3. Envelope Accept and Reject 
    if (y< (1-x^2/2)/exp(lambda^2/2-lambda*abs(x))) {
      X[i] <- x; break
    }  else if (y <= exp(-(abs(x)-lambda)^2/2)) {
      X[i] <- x; break} }  }
  return(X)
}

set.seed(2020)
mysample <- r.mynormal.evenlope(n=2000, lambda=1) #genertate 2000 random samples

# plot the ecdf and compare to the normal density 
plot(density(mysample),lwd=2, main=" Simulated and actual
      pdf of N(0,1)" )
curve(dnorm(x), add=T, lwd=2, lty=3, col="red") 
legend(x=1.8, y=0.4, legend=c("Simulated pdf", "Actual pdf"), 
       lty=c(1,3), cex=0.6)


## Importance Sampling

## Criticism of AR Sampling is that it generates "useless" simulations when rejecting. Lots of samples are rejected and therefore
## Wasted and so the efficiency of AR sampling really does come into question 

## Rare events are completely neglected in AR sampling where very few points or even none inside the region we are looking at

## Importance sampling works by using an importance sampling density function that will oversample the important region
## Because of this oversampling we have to adjust out estimate

## Think of this as the importance sampling density function is covering more of the distribution because the original
## Density function does not account for this

## Failure of plain monte carlo: The problem becomes computationally very challenging for a large value of t p(x_i > t) even when we
## directly generate N(0, 1) random numbers using rnorm()
## Due to the light tailedness of the normal distribution if we stray away from zero even a slight bit our results are skewed
## E.g. (x > t) where t = 5 is p_t = 2.86x10-7 which is stupidly small and clearly not right


#### Plain Monte Carlo
set.seed(2020)
#number of samples
samples <- c(10^3, 10^4, 10^5, 10^6, 10^7, 10^8) 
p.t <- NULL ## tail probability
compute.time <- NULL ## computing time
j <-0
for (n in samples){
  j <- j+1
  ## record the current system time
  start.time <- Sys.time()
  x <- rnorm(n) ## generate n samples
  p.t[j] <- sum(x>5)/n ## calculate the tail probability 
  end.time <- Sys.time()
  ## calculate the computing time in each loop 
  compute.time[j] <- as.numeric(end.time - start.time,
                                unit = "secs")
}

compute.time

## Now we will try and use the Importance sampling method exponential version in order to see a speed increase

#### Importance Sampling using exponential proposal

set.seed(2020)
n <- 1000
X <- rexp(n)+5 ##generate samples from shifted Exp(1) 
v.weights <- dnorm(X)/dexp(X-5) ## vector of weights 
p.t <- mean(v.weights) ## calculate the IS estimator

p.t


## Curves of convergence of the Importance sampling method

## vector of estimators
est.prob <- cumsum(v.weights)/(1:n)
## plot the convergence curve
plot(est.prob,type="l",lwd=2, xlab="Iterations",
     ylab="MC estimation")
abline(a=1-pnorm(5),b=0, lwd=2, lty=3, col="red")

## Importance sampling only makes sense for very extreme values of distribution X. and will have a smaller variance than the non importance 
## sampled counterpart. We have to also know the answer of what we want in order to implement this so is not typically possible. 








