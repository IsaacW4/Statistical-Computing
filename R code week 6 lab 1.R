## To be used for lab 1 in week 6


## Question 1
## a)
calcFx = function(x = NULL){
  if (x < 1){
    return(x)
  }else{
    x1 = x^2
    return(x1)
  }
}

## b)
calcFx(0.7)
calcFx(2.5)

## Question 2

## a)

calcFx2 = function(x = NULL){
  if (x < 1){
    return(x)
  }else{
    x1 = x^2
    return(x1)
  }
}

## b)

calcFx2(0.27)
calcFx2(7.5)



## Question 3

## a)


test = function(x){
  if (0.1 < x < 0.2){
    return(x)
  }
}


?pbinom
whichQuartile = function(n = NULL, x = NULL, p = NULL){
  z = pbinom(q = x, size = n, prob = p)
  chr = NA
  if (z < 0.25){
    chr = "First Quartile"
    return(chr)
  }else if (0.25 <= z && z < 0.5){
    chr = "Second Quartile"
    return(chr)
  }else if (0.5 <= z && z < 0.75){
    chr = "Third Quartile"
    return(chr)
  }else if (0.75 <= z){
    chr = "Fourth Quartile"
    return(chr)
  }
}

## b)

whichQuartile(10, 7, 0.65)

## Question 4

## a)

stopExample = function(){
  x = 1
  y = 2
  stop("There is a problem")
  z = x + y
  
}

stopExample()


## b)
inverse = function(x){
  if (x == 0){
    stop("Non-zero arguement required!")
  }else{
    y = 1/x
    return(y)
  }
}

inverse(5)





























