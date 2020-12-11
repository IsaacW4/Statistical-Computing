## R code for week 9 lab 1

set.seed(42)

## Question 1

1-pchisq(q=10, df=2)

## 1.1

chisq_func = function(){
  samples = c(100, 1000, 10000, 100000)
  for (n in samples){
    x = rchisq(n, 2)
    print(mean(x>10))
  }
}

chisq_func()

## 1.2

## ?? Wordy question

## Answer: The importance weight is w(x) =π(x)q(x)=π2Γ(1)(1 +x2)e−x/2I(x >0)
## The algorithm is: 
## 1. Draw X1,...,Xn from Cauchy(0, 1).
## 2. Calculate the importance weights:w(X1),...,w(Xn)
## 3. Estimate the tail probability as In=1n∑ni=1w(Xi)I(Xi>10)

## 1.3 

chisq.tailprob<-function(n){
  #Step 1. samples from proposal density
  X <- rcauchy(n)
  #Step 2. Calculate the importance weights vector
  X[X<=0] <- 0 #cutting the negative values of X to be zero, to prevent producing NaN in exp(-X/2)
  v.weights <- pi/2*(1+X^2)*exp(-X/2)*(X>0)
  # Step 3. Calculate the estimator
  p.t <-mean(v.weights*(X>10))
  return(p.t)
}



## 1.4
samples <-c(100, 10^3, 10^4, 10^5)

for (n in samples){
  print(chisq.tailprob(n))
}



## Question 2

## 2.1

## : The importance weight without constant term is ̃w(x) = ̃π(x) ̃q(x)= (1 +x2)e−x/2I(x >0)
## The algorithm is:
## 1. Draw X1,...,Xn from Cauchy(0, 1)
## 2. Calculate the normalised importance weights w∗(X1),...,w∗(Xn) as w∗(Xi) = ̃w(Xi)∑ni=1 ̃w(Xi)
## 3. Estimate the tail probability as I^NIS_n = ∑ni=1w∗(Xi)I(Xi>10)


## 2.2
chisq.tailprob.nis<-function(n){
  # Step 1. samples from proposal density
  X <-rcauchy(n)
  # Step 2. Calculate the normlaised importance weights vector
  X[X<=0] <- 0 #cutting the negative values of X to be zero, to prevent producing NaN in exp(-X/2)
  w.tilde <- (1+X^2)*exp(-X/2)*(X>0)
  w.star <- w.tilde/sum(w.tilde)
  # Step 3. Calculate the estimator
  p.t <- sum(w.star*(X>10))
  return(p.t)
  }


## 2.3 

for(n in samples){
  print(chisq.tailprob.nis(n)) ## print the tail probability
  }


## Question 3

## 3.1

## The SIR algorithm is:
## 1. Draw Y1,...,Ym from Cauchy(0, 1) for some m > n.
## 2. Calculate the normalised importance weightsw∗(Y1),...,w∗(Ym)asw∗(Yi) = ̃w(Yi)∑mi=1 ̃w(Yi)
## where the formula for w∗(x) can is the same as in Question 2 (2.1).
## 3.Resample X1,...,Xn from Y1,...,Ym with replacement, with associated probabilities w∗(Y1),...,w∗(Ym)


## 3.2

r.mychisq.sir<-function(n,m){
  # Step 1. samples from proposal density
  Y <-rcauchy(m)
  # Step 2. Calculate the normalized importance weights vector
  Y[Y<=0] <- 0 #cutting the negative values of X to be zero, to prevent producing NaN in exp(-X/2)
  w.tilde <- (1+Y^2)*exp(-Y/2)*(Y>0)
  w.star <- w.tilde/sum(w.tilde)
  # Step 3. Calculate the estimator
  X <-sample(Y, size = n, replace = TRUE, prob = w.star)
  return(X)
  }


## 3.3 

mysample <-r.mychisq.sir(n=1000, m=2000)
plot(density(mysample), ylim=c(0,0.5), lwd=2, main=" Simulatedand actual pdf of Chi-square(2)" )
curve(dchisq(x,df=2), add=T, lwd=2, lty=3, col="red")
legend(x=10, y=0.5, legend=c("Simulated pdf","Actual pdf"),col=c("black","red"),lty=c(1,3), cex=0.6)


## To be used for the quiz 7 in week 9 


## Question 1: In this week's Lecture 1 Example 3.5, we use importance sampling to estimate the tail probability straight double-struck capital p
## left parenthesis X greater than 5 right parenthesis for random variable X tilde N left parenthesis 0 comma 1 right parenthesis.
## If we still want to estimate straight double-struck capital p left parenthesis X greater than 5 right parenthesis but replace the proposal
## density with the exponential distribution Exp(1) shifted by 4.5, which of the following is the resulting new estimator?

## Answer: D is the answer we think

## Question 2: Which of the following statement is TRUE about Importance Sampling and SIR algorithms?

## Answer: Not a clue 

