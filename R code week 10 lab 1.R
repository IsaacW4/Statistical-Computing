## R code to be used for Week 10 lab 1

set.seed(42)

## Question 1. Gibbs Sampler

## 1.1

## Conditional probabilities 

## pi(x|y) = pi(x,y) / pi(y) = e^-x / (1 - e^-y) for 0<x<y

## pi(y|x) = pi(x,y) \ pi(x) = e^(x-y) for y > x


## 1.2

r.mytexp <-function(y){
  u <-runif(1)
  x <- -log(1-u*(1-exp(-y)))
  return(x)
  }
  
  

## 1.3

Y <-rexp(1)+3
Y



## 1.4

## The Gibbs Sampler algorithm is: 
## 1. Set value of initial vector(x(0),y(0)).
## 2. Forj= 1,2,. . .DrawX(j)=x(j)fromπ(x|y(j−1));DrawY(j)=y(j)fromπ(y|x(j)).


## 1.5

gibbs.bivariate <-function(x0, y0,  n, m){
  # generating n samples of (X,Y) values by the Gibbs
  # sampler. In total m+n samples are generated but the first m are discarded.
  x.seq <- y.seq <-rep(NA, m+n+1) #set sequences
  x.seq[1] <- x0y.seq[1] <- y0 #initial values
  for (j in 2:(m+n+1)) {
    #sample from x | y
    x.seq[j] <-r.mytexp(y=y.seq[j-1])
    #sample from y | x
    y.seq[j] <-rexp(1)+x.seq[j]
  }
  result <-list(X=x.seq[(m+2):(m+n+1)],Y=y.seq[(m+2):(m+n+1)])
  # discard the initial value and first m samplesreturn(result)
  }



## 1.6

mysamples=gibbs.bivariate(x0= 2, y0= 3, n=1000, m=200)
par(mfrow=c(1,2))
points=seq(from=0, to=8, length.out=2000)
plot(density(mysamples$X), main="simulated and actual pdf of X",xlab="X", lwd=2)
lines(x=points, y=2*exp(-2*points), lwd=1.5,lty=3,col="red")

plot(density(mysamples$Y), main="simulated and actual pdf of Y",xlab="Y", lwd=2)
lines(x=points, y=2*exp(-points)*(1-exp(-points)),lwd=1.5,lty=3,col="red")



## Question 2. Metropolis - Hastings (M-H) Algorithm

## 2.1 

## In this caseq(x|y) =f(x) = 1,0< x <1, wheref(x)is density of Unif(0,1). Therefore we have
## α= min{π(x)π(x(j−1))q(x(j−1)|x)q(x|x(j−1)),1}= min{π(x)π(x(j−1)),1},whereπ(x)is the pdf of Beta(a,b).

## The M-H algorithm is: 
## 1. SetX(0)=x(0).
## 2. Forj= 1,2,
## DrawY=y∼f(x),Computeα= min{π(y)π(x(j−1)),1}
## DrawU=u∼Unif(0,1)
## TakeX(j)=x(j)={y,ifu≤αx(j−1),ifu > α



## 2.2


r.mybeta.mh<-function(x0, a, b, n, m){
  X <-rep(NA, n+m+1)X[1] <- x0 #initial value
  for(j in 2:(n+m+1)){
    Y <-runif(1) # uniform proposal
    alpha<-min(dbeta(Y,a,b)/dbeta(X[j-1],a,b),1)
    if(runif(1)<=alpha){
      X[j] <- Y
    }
    else{X[j] <- X[j-1]
    }
    
  }
  return(X[(m+2):(n+m+1)])
}




## 2.3


mysamples <-r.mybeta.mh(x0=0.5, a=2, b=8, n=1000, m=200)
par(mfrow=c(1,3))plot(mysamples, type="l",lwd=2, main="Markov Chain")
acf(mysamples, lwd=2, main="Autocorrelations")
plot(density(mysamples),ylim=c(0.0,3.75),lwd=2, main="Simulated and actual pdf")
curve(dbeta(x,2,8),from=0,to=1, add=T,lwd=1.5, lty=3, col="red")


## R code to be used the quiz this week


## Question 1

## D 

## Question 2

## Gibbs Sampling














