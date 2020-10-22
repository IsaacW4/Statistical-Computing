##Data manipulation within R
setwd("C:/Users/Isaac/Desktop/R Code")
load("Statistical Computing/week2-lab2.RData")
ls()

##A package built into R with a variety of datasets you can use and manipulate
library(datasets)
data("iris")
class(iris)
summary(iris)

##Gives more information on the datasets package
library(help = "datasets")

##Installing packages
install.packages("glmnet")
##Loading packages
library(glmnet)

##Loading datasets
Pokemon <- read.csv("C:/Users/Isaac/Desktop/R Code/Pokemon.csv")
##View dataset
View(Pokemon)

write.csv(Pokemon, file = "Pokemon1.csv")

##Installing some data packages
install.packages("readxl")
install.packages("writexl")

##Reading excel files
library(readxl)
my_data3<-read_excel("people.xlsx",  sheet=1)
View(my_data3)

##Installing more data packages
install.packages("foreign")
library(foreign)

##Data Manipulation 
Pokemon$AD <- Pokemon$Atk + Pokemon$Def
pokemon1 <- Pokemon[, -c(10:15)]

##Cutting categories into each section of speed
Pokemon$speed_cut<-cut(Pokemon$Spd,
                        breaks =c(0, 50, 100, 150),#cutpoints
                        labels=c("slow","mid","fast")
                        )



Pokemon$sum_score<-rowSums(Pokemon[, 3:8])
Pokemon$mean_score<-rowMeans(Pokemon[, 3:8])

##Changing column names 
colnames(Pokemon)[c(4,5)]<-c("Attack","Defence")

##Changing the levels of "captive" and "wild" as being 1 and 0 
Pokemon$Captive<-factor(Pokemon$Captive)
levels(Pokemon$Captive)
levels(Pokemon$Captive)=c("0","1")


##Scaling and standardizing 
Pokemon$scale_HP<-scale(Pokemon$HP)

##Dealing with missing values

Pokemon$Spd[1:5]<-NA
mean(Pokemon$Spd)

mean(Pokemon$Spd, na.rm=TRUE)

##Ommitting cases where there are missing rows
Pokemon_complete<-Pokemon[complete.cases(Pokemon), ]

##The method of imputing, it uses the median / mean value to fill in missing rows
install.packages("imputeMissings")
library(imputeMissings)
Pokemon_imputed<-impute(Pokemon)

 

aov1<-aov(HP~Type.I, data=Pokemon)
summary(aov1)