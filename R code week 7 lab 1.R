## R code for week 7 lab 1


## Question 1
## a) 

i = 0
intsum = 0
temp = 0
while(temp <= 200){
  intsum = temp
  i = i + 1
  temp = temp + i 
}

## b)

intsum
i - 1

## 19 integers to sum and you get a number of 190 as the final answer


## Question 2

## a)

checkToiletRolls = function(basket, limit){
  toiletrolls = 0 
  for (i in 1:length(basket)){
    item = basket[i]
    if (item == "toilet rolls"){
      toiletrolls = toiletrolls + 1
    }
    
    if (toiletrolls > limit){
      message("Sorry you have exceeded the limit of specific items")
      break()
    }
    
    
  }
  
  return(basket[1:i])
  
}

basket1 = c("toilet rolls", "oranges", "tooth paste", "pasta sauce", "toilet rolls", "toilet rolls", "apples")
checkToiletRolls(basket1, 2)

## b)

checkShopping = function(basket, limitedEssentials, limit){
  essentialsCount = vector(length = length(limitedEssentials))
  names(essentialsCount) = limitedEssentials
  for (item in basket){
    if (any(item == limitedEssentials)){
      essentialsCount[item] = essentialsCount[item] + 1
    }
    
    
    if(any(essentialsCount > limit)){
      message("Sorry you have exceeded the amount of items for this essential product")
      break()
    }
  }
  
  return(essentialsCount)
  
}

basket2 = c("hand sanitiser", "toilet rolls", "oranges", "tooth paste", "pain killers", "pasta sauce", "hand sanitiser", "hand sanitiser", "apples")
checkShopping(basket2, c("pain killers", "toilet rolls", "hand sanitiser"), limit = 2)
  

  
## Question 3

## a) 

?rexp

rexp(10, 0.5)


sampleRates1 = vector(length = 10000)
for (s in 1:10000){
  samples = rexp(10, 0.5)
  sampleRates1[s] = 1/(mean(samples))
}

hist(sampleRates1, prob = T, nclass = 50, xlab = "MLE of rate parameter", main = "Distribution of the MLE \n of the rate parameter (n = 10)")
normDens = dnorm(seq(0,1, by = 0.001), mean = mean(sampleRates1), sd = sd(sampleRates1))
lines(x = seq(0,1, by = 0.001), y = normDens)

## b)

sampleRates2 = vector(length = 10000)
for (s in 1:10000){
  samples = rexp(1000, 0.5)
  sampleRates1[s] = 1/(mean(samples))
}

hist(sampleRates1, prob = T, nclass = 50, xlab = "MLE of rate parameter", main = "Distribution of the MLE \n of the rate parameter (n = 10)")
normDens = dnorm(seq(0,1, by = 0.001), mean = mean(sampleRates1), sd = sd(sampleRates1))
lines(x = seq(0,1, by = 0.001), y = normDens)

## c) 

sampleRates3 = vector(length = 10000)
for (s in 1:10000){
  samples = rexp(10000, 0.5)
  sampleRates1[s] = 1/(mean(samples))
}

hist(sampleRates1, prob = T, nclass = 50, xlab = "MLE of rate parameter", main = "Distribution of the MLE \n of the rate parameter (n = 10)")
normDens = dnorm(seq(0,1, by = 0.001), mean = mean(sampleRates1), sd = sd(sampleRates1))
lines(x = seq(0,1, by = 0.001), y = normDens)







