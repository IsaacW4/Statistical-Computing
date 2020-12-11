## To be used for this weeks lab 1


## Set the seed so we can reproduce the answers necessary
set.seed(42)


## Question 1 : Warm-up: pseudo-RNG for Uniform Distribution



## Generating Pseudo random numbers

## 1. Linear Congruential generator

## 1.1

r.myunif = function(n, X0){
  ##Initialisation
  
  M<-2^32; 
  a<-1103515245; 
  b<-12345
  ##fix random seed
  
  ##Generate2000pseudo-randomnumbers
  
  X<-NULL 
  for (i in 1:n){
    if (i==1){
      X[i] <- (a*X0 +b) %% M
    }else X[i]<-(a*X[i-1] +b) %% M
    
  }
  Y<-X/M
  return(Y)
}

r.myunif(10, 42)
r.myunif(100, 42)

data1 <- r.myunif(10000, 42)


## 1.2

plot(density(data1), lwd=2, xlim=c(0,1),main="Empirical and actual pdfs of Unif(0,1)" ) # density plot
curve(dunif(x), from=0, to=1, add=T, lwd=2, lty=3, col="red")
legend(x=0.75, y=0.3, legend=c("Empirical pdf","Actual pdf"),lty=c(1,3), col=c("black", "red"), cex =0.7)


## 1.3


r.myunif1 = function(n, X0, min, max){
  ##Initialisation
  
  M<-2^32; 
  a<-1103515245; 
  b<-12345
  ##fix random seed
  
  ##Generate2000pseudo-randomnumbers
  
  X<-NULL
  for (i in 1:n){
    if (i==1){
      X[i] <- (a*X0 +b) %% M
    }else X[i]<-(a*X[i-1] +b) %% M
    
  }
  Y<- min + X/M*(max - min)
  return(Y)
}

r.myunif1(10, 42, 0, 1)
r.myunif1(10, 42, -8, 10)





## 1.4

data2 <-r.myunif1(10000, 42, -8, 10)
plot(density(data2), lwd=2, xlim=c(-8,10),main="Empirical and actual pdfs of Unif(-8,10)" ) # density plot
curve(dunif(x, min=-8, max=10), from=-8, to=10, add=T, lwd=2, lty=3, col="red")
legend(x=6, y=0.02, legend=c("Empirical pdf","Actual pdf"),lty=c(1,3), col=c("black", "red"), cex =0.7)


## Question 2

## 2.1

## 1. Draw U=u from Unif(0, 1).
## 2. Set x= 0 if U≤1−p; x= 1 if U > 1−p.
## 3. Deliver X=x


## 2.2

#function to Generate Bernoulli (p)
r.myBernoulli <-function(n, p){
  X <- NULL 
  for(i in 1:n) {
    u <-runif(1)
    if(u<=1-p){
      x=0
    }else{
      x=1
      }
    X[i] <- x 
  }
  
  return(X)
  
  }


## 2.3

data3 <- r.myBernoulli(n=1000 , p=0.6)
sum(data3)# count the number of 1s


## Question 3



## 3.1

##The algorithm is:

## 1. Draw X=x from Cauchy(0,1).
## 2. Draw Y=y from Unif(0,1).
## 3. If y≤√e2π f(x)/g(x) = √e/2(1 +x^2)e^−x2/2 accept X=x; else reject X=x

## The probability of acceptance is √e2π


## 3.2

# Function to generate N(0,1)
r.myNormal.C <-function(n){
  X <- NULL 
  count <- 0
  for(i in 1:n) {
    repeat{ x <-rcauchy(1)
    y <-runif(1)
    count <- count+1
    if (y <= sqrt(exp(1))/2*(1+x^2)*exp(-x^2/2)) {
      X[i] <- x
    break } 
    }
  }
  return(list(X=X, count=count))
}




## 3.3


result <-r.myNormal.C(n=1000)
data4 <- result$X # 1000 random samples
totalsamples <- result$count # number of total sample used in A-R sampling 
1000/totalsamples


## 3.4


plot(density(data4), lwd=2,  main=" Empirical and  actual pdfs of N(0,1)" ) # density plot
curve(dnorm(x), add=T, lwd=2, lty=3, col="red")
legend(x=2, y=0.3, legend=c("Empirical pdf","Actual pdf"),lty=c(1,3), col=c("black", "red"), cex =0.7)







