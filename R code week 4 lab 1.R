##Start of the lab let us import our datasets and the create a dataframe out of them
##Lets also attach it 
liver.cells <-read.table("liver.cells.txt", header = FALSE)
liver.section <-read.table("liver.section.txt", header = FALSE)
liver.exper <-read.table("liver.exper.txt", header = FALSE)
liver.gt <-read.table("liver.gt.txt", header = TRUE)
liver <-data.frame(liver.cells, liver.section, liver.exper, liver.gt)
colnames(liver) <-c("cells", "section", "exper",colnames(liver.gt))

attach(liver)


##We can plot histograms for all of our data and it will show in the plots section of RStudio
hist(cells)
##We can also change the colours, and the borders of each individual histogram
hist(cells, main="Number of Cells injected", xlab="number of Cells", col="darkmagenta", border = "red")

##A very similar plot to histogram is called a barplot, it uses a matrix or a vector as the heights of the bars in the plot
##If input is a vector the values determine heights of the plots
##If input is a matrix then each bar is a column of the input

counts <- table(exper)
counts
barplot(counts, main="Experiment Distribution", xlab="Experiment")

##We can also produce a stacked barplot with different colours
table(section, exper)
counts <- table(section, exper)
barplot(counts, main="Observations by section and experiment", xlab="Experment", col=c("darkblue","red"), legend =c("section 1","section 2"))

##We also saw we could use boxplots, and we can feed a series of vectors(or a matrix) to obtain side by side boxplots of the response from all 4 lobes
boxplot(ARL, PRL, PPC, AC, ylab = "Response", xlab="Lobe", names = c("ARL", "PRL", "PPC", "AC"), col=c(2,3,4,5))

##A new sort of plotting function we can use is pairwise scatter plots that produce numerous scatter plots between different variables
##This is very useful if you want to see relationships between 2 quantities, we use cbind to pair the responses together and labels aswell
pairs(cbind(ARL, PRL, PPC, AC), labels = c("ARL", "PRL", "PPC", "AC"))


##Emprical density function and distribution function
##Probability density function (pdf) can be interpreted as providing a relative likelihood that the value ofthe random variable would equal that sample
##We can create the plot usingplot(density(x)), where x isthe numeric vector of data points
plot(density(ARL))

##we can change the line features of the density plot and fill the area below the curve
d <-density(ARL)
plot(d, main="Empirical Density of ARL response")
polygon(d, col="pink", border="blue")

##Cumulative distribution function (CDF) of a random variable gives the probability that the random variable will take a value less than or equal to certain value
##Similarly, we can plot the empirical cumulative distributionfunction (eCDF) to inspect the distribution of our data
plot(ecdf(ARL), main="Empirical CDF of ARL response")

## QQ plots 
## QQ plot draws the correlation between a given sample and the normal distribution. 
## QQ plots are used to visually check the normality of the data
## We use the function qqnorm to produce quantile-quantile plot for normality check and the function qqline to add the reference line
qqnorm(PRL)
qqline(PRL, col = "steelblue", lwd = 2)



##Now let's see how we plot some random functions within R
##Plot a sin curve
##This makes a sequence of numbers that goes from -pi to pi with 1000 data points 
seq(-pi, pi, length.out = 1000)
x <- seq(-pi, pi, length.out = 1000)
##Plot the sin of each value of x
y <- sin(x)
##Plots the sin curve which is very smooth because of 1000 points are connected together
plot(x, y, type = "l")
##Choosing a different number of points can drastically effect the plot
par(mfrow =c(2,2))
x <-seq(-pi, pi, length.out=5)
plot(x,sin(x), type= "l")
x <-seq(-pi, pi, length.out=10)
plot(x,sin(x), type= "l")
x <-seq(-pi, pi, length.out=100)
plot(x,sin(x), type= "l")
x <-seq(-pi, pi, length.out=1000)
plot(x,sin(x), type= "l")

dev.off()

##Plot a normal density between -3 and 3. Thankfully R has built in functions for this sort of thing that will make it alot easier for us 
x <- seq(-3, 3, length.out = 100)
##Can make things easier using this instead
x <-seq(from = -3, to = 3, length.out = 100)
plot(x,dnorm(x), type = "l", xlab = "x", ylab = "Density")
##Lets compare this with the t distribution with 4 degrees of freedom
plot(x,dnorm(x), type = "l", xlab = "x", ylab = "Density")
lines(x,dt(x, df = 4), lty = 2)
legend(-3, 0.4, lty =c(1, 2), legend =c("Standard normal", "t (df = 4)"))


##The same plot, but shows a common occurence within R
##We plot the t plot first and this fixes the axis of the plot, so when we plot the second curve it goes off the screen as you can't change the plot size
plot(x,dt(x, df = 4), type = "l", xlab = "x", ylab = "Density", lty = 2)
lines(x,dnorm(x), lty = 1)
legend(-3, 0.4, lty =c(1, 2), legend =c("Standard normal", "t (df = 4)"))

##To fix the problem, pre compute the densities of both the normal and t distributions so we can calculate their joint maximums
##We then specify the limits of the y axis
yn <-dnorm(x)
yt <-dt(x, df = 4)
maxy <-max(yn, yt)
plot(x, yt, type = "l", xlab = "x", ylab = "Density", lty = 2, ylim =c(0, maxy))
lines(x, yn, lty = 1)
legend(-3, 0.4, lty =c(1, 2), legend =c("Standard normal", "t (df = 4)"))









##A taste of ggplot2 (Not assessed in literally anyway)
install.packages("ggplot2")
library(ggplot2)
##Quick plot
?qplot



## Kernel density plots for PRL
## grouped by experiment (indicated by color)
## For example, we first plot the density of PRL response, divided into 3 groups by the experiment
qplot(PRL, data=liver, geom="density", fill=exper, alpha=I(.5), xlim=c(-20,40),main="Density of PRL", xlab="PRL response",ylab="Density")
## We produce a scatter plot of ARL versus PRL for each combination of experiment and section
qplot(PRL, ARL, data=liver,facets=exper~section, size=I(3),xlab="PRL", ylab="ARL")

## Then we plot the regressions of ARL on cells for each experiment
qplot(cells, ARL, data=liver, geom=c("point", "smooth"),
      method="lm", formula=y~x,
      color= exper,
      main="Regression of ARL on cells",
      xlab="number of injected cells", 
      ylab="ARL response")

## We produce a boxplots of PRL by experiment
qplot(exper, PRL, data=liver, geom=c("boxplot", "jitter"),
      fill=exper, main="PRL by experment",xlab="experiment",
      ylab="PRL")

## To learn more about ggplot2, see the ggplot reference site: https://ggplot2.tidyverse.org/reference/





