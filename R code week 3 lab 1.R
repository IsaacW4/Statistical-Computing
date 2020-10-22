
setwd("C:/Users/Isaac/Desktop/R Code")

liver.cells <- read.table("liver.cells.txt", header = FALSE)
liver.section <- read.table("liver.section.txt", header = FALSE)
liver.exper <- read.table("liver.exper.txt", header = FALSE)
liver.gt <- read.table("liver.gt.txt", header = TRUE)

liver <- data.frame(liver.cells, liver.section, liver.exper, liver.gt)

colnames(liver)[1] <- "cells" 
colnames(liver)[2] <- "section" 
colnames(liver)[3] <- "exper" 
colnames(liver)

mean(liver$cells)

liver$ones <- rep(1, 52)
head(liver)
liver$ones <- NULL

##The apply function can apply statistical operations to many rows and columns all at the same time, it's a very general function
?apply
help(apply)
liver[,c(4:7)]

apply(liver[,c(4:7)], 1, mean)
rowMeans(liver[,c(4:7)])
apply(liver[,c(4:7)], 2, var)

?tapply
help(tapply)

tapply(liver$cells, liver$exper, mean)

?lapply
help(lapply)


##Matrix manipulation
X <-matrix(c(2, 1, 0, 1, 4, 1, 0, 1, 3), nrow = 3)
Y <-matrix(c(2, 4, 6, 1, 2, 3), nrow = 3)

dim(X)
dim(Y)

Z <- X%*%Y
Z

##Column combine
cbind(X, Y)

##Row combine
rbind(Y, Z)

##Playing with the diag command
diag(X)

diag(X) <- c(1,2,3)
X

diag(4)

##Transpose
t(Y)

#Finds inverse
solve(X)

##Data frame manipulation 
attach(liver)
cells

detach(liver)
cells

dim(liver)

cells > 5
exper == "A"

cells[cells > 5]
ARL[exper == "A"]
ARL[exper=="A"&cells>5]
PRL[exper=="A"&cells>3]
mean(AC[section==1|cells<5])


dat1 <-data.frame(liver.cells, liver.gt)
colnames(dat1)[1] <- "cells"
dat2 <-data.frame(liver.cells, liver.exper)
colnames(dat2)[c(1,2)] <-c("cells","exper")

dat <-merge(dat1, dat2, by = 1)
head(dat)

##Using this for help with the Quiz 1 on BB 
median(cells) ##Answer is 4

mean(cells[exper=="A"]) ##Answer is 5.31

var(cells[cells > 3 & cells < 9]) ##Answer is 0.8

X <- cbind(1, liver$ARL)

X_1 <- t(X) %*% X

solve(X_1) ##Answer is -0.0012 MAYBE (Might be a mistake) MY MISTAKE
