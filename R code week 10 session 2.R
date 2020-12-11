## R code to be used for week 10 session 2


## Gibbs sampler 

#------------ Example 3.8 hierarchical model----------------------------

gibbs.hierarchical = function(X0, p0, N0, n, J){
  # generating n samples of (X,p,N) values by the Gibbs
  # sampler. In total J+n samples are generated but the first J are discarded.
  # (x0,p0,N0) is the initial value. 
  
  x.seq <- p.seq <- N.seq <- rep(NA, J+n+1) #set sequences
  x.seq[1] <- X0; p.seq[1] <- p0; N.seq[1] <- N0 #initial values
  
  for(j in 2:(J+n+1)) {
    x.seq[j] <- rbinom(1, N.seq[j-1], p.seq[j-1])
    p.seq[j] <- rbeta(1, (x.seq[j] + 2), 
                      (N.seq[j-1] - x.seq[j] + 4))
    N.seq[j] <- rpois(1, 16 * (1 - p.seq[j])) + x.seq[j]
  }
  result <- list(X=x.seq[(J+2):(J+n+1)],p=p.seq[(J+2):(J+n+1)],
                 N=N.seq[(J+2):(J+n+1)]) # discard the initial value and first J samples
  
  return(result)}


set.seed(2020)
n=1000
mysamples=gibbs.hierarchical(8, 0.5, 16, n=n, J=100)
par(mfrow=c(1,3))
plot(sort(unique(mysamples$X)), 
     as.numeric(table(mysamples$X)/n),
     type='h',lwd=2, xlab="X", ylab="probability", 
     main="simulated pdf of X") 

plot(density(mysamples$p), main="simulated pdf of p", 
     xlab="p", lwd=2)

plot(sort(unique(mysamples$N)), 
     as.numeric(table(mysamples$N)/n),
     type='h',lwd=2, xlab="N",
     ylab="probability", main="simulated pdf of N")






#--------Example 3.9 Cauchy(0, 1) distribution--------------------


r.mycauchy.mh<- function(n, proposal){
  X <- c(rnorm(1))  #initialization, note X is vectorized
  for (j in 2:n){
    if(proposal == "normal"){
      Y <- rnorm(1)        # normal proposal 
      alpha <- min(dcauchy(Y)*dnorm(X[j-1])/ #probability
                     (dcauchy(X[j-1])*dnorm(Y)),1) 
    }else if(proposal == "t"){
      Y <- rt(1, df=0.5)        # Student's-t proposal 
      alpha <- min(dcauchy(Y)*dt(X[j-1], df=0.5)/ #probability
                     (dcauchy(X[j-1])*dt(Y, df=0.5)),1) 
    } else{ return("proposal not found") }
    
    if (runif(1) <= alpha){
      X[j] <- Y
    }else{
      X[j] <- X[j-1]}
  }   
  return(X) }


## Normal proposal
set.seed(2020)
X <- r.mycauchy.mh(n=2000, proposal="normal")

par(mfrow=c(2,2),mar=c(4,4,3,0.6)) 
#1st plot
plot(X, type="l", main="Chain") #plot the chain

#2nd plot # density comparing to the true one
hist(X,freq=F, main="Density") 
lines(density(X))
curve(dcauchy(x),from=-4,to=4,add=T,lwd=1.5,lty=3,col="red")

#3rd plot: auto correlation in the chain
acf(X, lwd=2, main="Autocorrelation")

#4th plot: tail probability for X>3
plot(cumsum(X>3)/(1:2000),lwd=2,ty="l",main="Tail Prob")


## student t proposal 
set.seed(2020)
X <- r.mycauchy.mh(n=2000, proposal="t")

par(mfrow=c(2,2),mar=c(4,4,3,0.6)) 
#1st plot
plot(X, type="l", main="Chain") #plot the chain

#2nd plot # density comparing to the true one
hist(X[abs(X)<4],freq=F, main="Density") 
lines(density(X[abs(X)<4]))
curve(dcauchy(x),from=-4,to=4,add=T,lwd=1.5,lty=3,col="red")

#3rd plot: autocorrelation in the chain
acf(X, lwd=2, main="Autocorrelation")

#4th plot: tail probability for X>3
plot(cumsum(X>3)/(1:2000),lwd=2,ty="l",main="Tail Prob")














