## R code for week 7 session 1


## Today we're going to be focusing on implementing loops into our code
## We can go over while loops, for loops and repeat loops

## While loops include while(testExpression) and testExpression is evaluated to either True or False and will be repeated
## Aslong as it keeps on being True. It exits the loop when it's evaluated to false

## Examples of loops

i = 1
while(i <= 5){
  print(i)
  i = i + 1
}

## Example 2

i = 1
intsum = 0 
while(intsum < 100){
  intsum = intsum + i
  i = i + 1
}

intsum
i


## Example 3 / condition checking with while loops

procTracking = function(){
  code = readline("Please enter your tracking number: ")
  code = as.numeric(code)
  while(is.na(code)){
    message("Sorry we cannot understand you.")
    code = readline("Please re-enter your tracking number: ")
    code = as.numeric(code)
    
    }
  return(code)
  
}

procTracking()

## Example 4 - For loops : Usually for a list of iterations from 1 to n 

for(num in 1:5){
  print(num)
}

## Example 5

mix = list(7, "tortoise", TRUE)

for(elt in mix){
  print(elt)
}

## Example 6 Fibonacci sequence 

fib = function(n){
  n1 = 0
  n2 = 1
  for(i in 2:n){
    n3 = n1 + n2
    n1 = n2
    n2 = n3
  }
  return(n3)
}


fib(20)

## Example 7 - Repeat loops uses break commands to exit the loop

x = 1
repeat {
  print(x)
  x = x + 1
  if (x == 6){
    break
  }
}

## Can use the break statement to exit ANY type of loops, it's not limited just to while and for loops

## Loops inside loops 

for (i in c(1:2)){
  for (j in c(1:3)){
    print(j)
  }
}








