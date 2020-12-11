## R code to be used for week 10 session 1


## Markov Chain Monte Carlo (MCMC) Setup


##  far, we have learned that we can (use our computer) draw random variables (vectors) from some desired distributions, 
## by A-R Sampling or by Importance Sampling. You may wonder if they are the Panaceas for random number generation. 

## Question 1: Is there any disadvantages of those two methods?

## Question 2: Is there any problems in which it is very hard(if not impossible) to get i.i.d samples as in A-R and IS?


## Sadly and not surprisingly,
## Answer to Question 1: Yes. A-R sampling can be very expensive, and IS usually has a slow convergence rate (= approximation is less accurate in finite sample)
## when the problem dimension is high.

## Answer to Question 2: Yes. Sometimes it is more convenient to sample in a dependent/sequential way.


## Actual setup





