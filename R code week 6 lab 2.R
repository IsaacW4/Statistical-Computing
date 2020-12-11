### To be used for week 6 lab 2

## Essentially this is used to print messages
message("hello")

## Readline function, the function allows you to take an input and store it as an arguement
input = readline("Please type something:  ")
input


## As.numeric converts numeric values into numeric objects
piVal = "3.1412159"
piVal = as.numeric(piVal)
piVal

## Question 1

message("Sorry we cannot understand")

## Question 2

answer = readline("Please enter either yes or no:  ")
answer

## Question 3
## BIG BOY QUESTION ## 

## Part A # 
# i)
procTrackingCode = function(){
  # ii)
  code = readline("Please provide the tracking code of your package:  ")
  # iii)
  code = as.numeric(code)
  # iv)
  test = is.na(code)
  if (test == TRUE){
    message("Sorry we cannot help without a valid tracking code")
  }else{
    message("Your package is on its way to you")
    
  }
  
}

procTrackingCode()

## Part B ##
# i) 
procPayment = function(){
  # ii)
  paymentDecision = readline("Would you like to make the payment (please enter either yes or no)?  ")
  # iii)
  if (paymentDecision == "yes"){
    message("Thank you for your payment")
  }else if (paymentDecision == "no"){
    message("We are sorry that we will not be able to deliver your package")
  }else{
    message("Sorry we cannot understand. Goodbye")
  }
}

procPayment()


## Part C ##
# i)
procWeight = function(){
  # ii)
  weightCategory = readline("Does you package weigh more than 2 kg (please enter either yes or no)?  ")
  # iii)
  if (weightCategory == "yes"){
    message("The delivery will cost £50")

  }else if (weightCategory == "no"){
    message("The delivery will cost £10")
    
  }else{
    message("Sorry we cannot understand")
  }
}

procWeight()

## Part D ## 
# i) 

procService = function(){
  # i)
  message("Hello, how can I help?")
  # ii)
  serviceType = readline("Please Enter 1 for sending a package, 2 for tracking a package, 3 for payment and 4 for other:  ")
  # iii) 
  serviceType = as.numeric(serviceType)
  # iv) 
  test = is.na(serviceType)
  if (test == "TRUE"){
    message("Sorry we cannot understand. Goodbye")
    
  }else if (serviceType == 1){
    procWeight()
    
  }else if (serviceType == 2){
    procTrackingCode()
    
  }else if (serviceType == 3){
    procPayment()
    
  }else if (serviceType == 4){
    message("Please enter your phone number and one of our staff members will contact you later:  ")
    
  }else{
    message("Sorry we cannot understand. Goodbye")
  }
  
  
}


procService()


## This is to be used for the quiz 4 this week for the weekly 2%

# Question 1

calcDiff = function(x, y){
  z = x - y
  return(z)
}

x = 5

calcDiff(x = 9,  y = 7)

# D. The command  calcDiff(x = 9,  y = 7) returns a value 2.

# Question 2

x = 0.5

y = NA

if(x < 0.33){
  
  y = "sausages"
  
}else if(x > 0.33 & x < 0.67){
  
  y = "bacon"
  
}else{
  
  y = "eggs"
}

y

# D. 	"bacon"






