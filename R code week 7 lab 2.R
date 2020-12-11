## R code to be used for week 7 lab 2


setwd("C:/Users/Isaac/Desktop/R Code")

## Question 1
numbers = c(18, 9, 3, 30, 29, 27 ,12, 21, 12, 27)

for (i in numbers){
  if (i %% 3 != 0){
    print(i)
    message(i, " is not divisible by 3")
    break()
  }
}


## Question 2

## a)

any(c(FALSE, TRUE, FALSE))
any(c(FALSE, FALSE))

forLoopAny = function(logicalVec){
  for (i in 1:length(logicalVec)){
    item = logicalVec[i]
    if (item == "TRUE"){
      return(TRUE)
      stop()
  }

  }
  return(FALSE)
}


forLoopAny(c(TRUE, FALSE, FALSE))
forLoopAny(c(FALSE, TRUE, FALSE))
forLoopAny(c(TRUE, FALSE, TRUE))
forLoopAny(c(FALSE, FALSE, FALSE))
log = c(FALSE, TRUE, FALSE)
length(log)

## b)

## Not currently working

whileLoopAny = function(logicalVec){
  j = 1
  k = length(logicalVec)
  item = logicalVec[i]
  while (j < k){
    if (item == "TRUE"){
      message("TRUE")
      j = j + 1 
  }
  }
  message("FALSE")
  
}

whileLoopAny(c(FALSE, TRUE, FALSE))
whileLoopAny(c(FALSE, FALSE, FALSE))

## Question 3

calories <- read.csv("C:/Users/Isaac/Desktop/R Code/calories.txt", sep="")
y = nrow(calories)
i = 0
j = 0
for (x in calories[1:y,]){
  s = dgamma(x, shape = 200, rate = 1)
  d = dgamma(x, shape = 750, rate = 3)
  if (s > d){
    print("fed by neighbours")
    i = i + 1
    
  }else if (s < d){
    print("not fed by neighbours")
    j = j +1
  }
  
}
message(j, " Times not fed by neighbours")
message(i, " Times fed by neighbours")
message(i + j, " times total")


## Question 4

## Not currently working

SAheart <- read.csv("C:/Users/Isaac/Desktop/R Code/SAheart.data")
chd1 <- SAheart$chd[SAheart$chd == "1"]
chd0 <- SAheart$chd[SAheart$chd == "0"]
SAheart8 <- within(SAheart, rm(chd))

group1 <- SAheart8[SAheart$chd == 1,]
group2 <- SAheart8[SAheart$chd == 0,]

group1[,2]
group2[,2]


k = ncol(SAheart8)

boxplot(group1[,2], group2[,2])

par(mfrow = c(2,4))

k = colnames(SAheart8)

for (i in 2:10){
  boxplot(group1[,i], group2[,i], xlab = "Group 1 and Group 2")
}


dev.off()



## To be used for week 7 quiz (Quiz 5)


## Question 1

i = 1

while(i <=10 ){
  
  if(i%%2 == 1){
    
    print(i)
  } 
  i = i + 1
  
}

## B) 1,3,5,7,9

## Question 2

symbols = c("Azure Dragon", "Vermilion Bird", "White Tiger", "Rat", "Black Tortoise")
for(sym in symbols){
  if(sym == "Rat"){
    break
  }
  print(sym)
}

## A) "Azure Dragon", "Vermilion Bird", "White Tiger"


















