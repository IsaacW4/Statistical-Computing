## R programming with functions II 
## We will be focusing on functions, conditions and loops



## We want to implement modularisation so we can reuse chunks of code without re running the exact same code
## This allows us to cut down on code and worry less about errors 
## To do this we want to call the function, we've already done this via examples such as boxplot()

## When creating an R function we use the function() directive
## Components of functions are the name, arguments and function body



## Creating an R function


#example.function = function(arg1, arg2, .... ,argP) {
#    <R commands>
#    return
#}


## Calling an R function

#example.function(arg1_obj ..... ) 

## Example of an R function

ex1func = function(argA, argB, argC) {
  output = argA * argB + argC
  return(output)
}

ex1func(1,2,3)
ex1func(3,2,1)

ex1func(argA = 1, argB = 2, argC = 3)
ex1func(argC = 1, argB = 2, argA = 3)



ex1func = function(argA, argB, argC) {
  output = argA * argB + argC
  return(output)
}

## The parts in curly brackets are the BODY of the function, and they are indented 
## return() is used to save and store the result

## We can return multiple values using data stored as vectors

ex2func = function(mean, sd) {
  cv = mean/sd
  eff = cv^2
  statsvec = c(cv, eff)
  return(statsvec)
}

ex2func(3,2)

## It's also possible to return multiple different data types at the same time

ex3func = function(mean, sd) {
  cv = mean/sd
  cvstr = paste("The CV is", cv, sep = " ")
  cvlist = list(cv, cvstr)
  return(cvlist)
}

ex3func(3,2)

