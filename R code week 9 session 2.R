## R code to be used for week 9 session 2

## NIS - Normalised importance sampling

## When calculating w-tilde you can drop the complex constant terms to make things a lot easier

##--------Example 3.6 Estimate E(|X|^{1/2}) of Cauchy(mu, sigma)-----------------

MCint.myCauchy <- function(n, mu, sigma, nu){
  ## This function is for cacluting the 0.5 moment from Cauchy(mu,sigma) distribution by 
  ## NIS algorithm, using t(nu) as proposal
  X <- rt(n,df = nu) #step 1. samples from proposal density
  w.tilde <- (1+X^2/2)^{(nu+1)/2}/ # Step2. normalised weight vector
    ((X-mu)^2+sigma^2)
  w.star <- w.tilde/sum(w.tilde) 
  
  I<- sum(w.star*abs(X)^{1/2})
  
  return(I)
}


## vector of estimators
set.seed(2020)
mc.est <- NULL
for(i in 1:200){
  I<-  MCint.myCauchy(n=10*i, mu=0, sigma=1, nu=2)
  mc.est[i] <- I
}
## plot the sequence of NIS approximation to observe convergence.
plot( mc.est,type="l", xlab="Iterations", ylab="MC mean", 
      main="MC mean estimator of Cauchy(0,1)")
abline(a=sqrt(2),b=0, lwd=2, lty=3, col="red")


## Sampling importance resampling SIR

## Adapted form of Importance sampling 

#----------Example 3.7 Generating Beta(a, b) a SIR-----------------

r.mySIRbeta <- function(m, n, nu, a, b){
  ## This function is for generating a sample of n
  ## observations from Beta(a,b) distribution with the 
  ## restriction that a >=1 and b>=1.
  Y <- rt(m,df = nu)
  w.tilde <- Y^(a-1)*(1-Y)^(b-1)*as.numeric(Y<1&Y>0)/
    (1+Y^2)^(-(nu+1)/2)
  w.star <- w.tilde/sum(w.tilde)              
  X <- sample(Y, size = n, replace = TRUE, prob = w.star)
  
  return(X)
}

set.seed(2020)
mysample <-  r.mySIRbeta(n=1000, m=2000, nu=2, a=2, b=3)


plot(density(mysample), ylim=c(0,2), lwd=2, main=" Simulated 
      and actual pdf of Beta(2,3)" )
curve(dbeta(x,2,3), add=T, lwd=2, lty=3, col="red")
legend(x=0.8, y=1.5, legend=c("Simulated pdf","Actual pdf"), 
       col=c("black","red"),lty=c(1,3), cex=0.6)













