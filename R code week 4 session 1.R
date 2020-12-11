##The start of R programming week 4 which will focus on graphics within R 
##This will be data visualization and will use graphs heavily, and also the plotting features

##The function plot
pokemon <- read.csv("Pokemon.csv", header=TRUE)
##Attach the dataset to R studio
attach(pokemon)

##Start a plot of HP against Atk
plot(x=HP, y=Atk)
##Same thing is being done here
plot(HP, Atk)

##There are many types of plot available for R
##This is a line plot where all points are joined together by a consecutive line, it looks quite messy for us 
plot(HP, Atk, type="l")

##Importing a dataset from UK COVID19 cases, this is a new dataset
uk <- read.csv("COVID-19_UK.csv", header = TRUE)
dim(uk)
##Plotting a good graph of cumalative data where using a line graph is applicable
plot(uk$day, uk$Cum_Cases, type ="l",xlab="DaySince31-01-2020", ylab="CumulativeCases")
##We can plot the points in loads of different ways other than line "l"

plot(uk$day, uk$Cum_Cases, type ="b",xlab="DaySince31-01-2020", ylab="CumulativeCases")
plot(uk$day, uk$Cum_Cases, type ="s",xlab="DaySince31-01-2020", ylab="CumulativeCases")
plot(uk$day, uk$Cum_Cases, type ="o",xlab="DaySince31-01-2020", ylab="CumulativeCases")
plot(uk$day, uk$Cum_Cases, type ="n",xlab="DaySince31-01-2020", ylab="CumulativeCases")

##Can also introduce main titles and sub titles into your plots that make it easier to present
plot(uk$day, uk$Cum_Cases, type ="l",xlab="DaySince31-01-2020", ylab="CumulativeCases",main="UKCOVID-19Cases",sub="datafromgov.uk")

##Shows all the parameters for the graphics function of R
help(par)
?par

##We can use colours to make our plots a little more interesting
plot(HP, Atk,col=3)
##Can also change certain points certain colours aswell
plot(HP, Atk,col=c(rep(2,100), rep(3,151)))

plot(uk$day, uk$Cum_Cases, type ="l",col="red",xlab="DaySince31-01-2020", ylab="CumulativeCases")
##In R we can specify colours by index or by hexadecimal format, can also change colour of basically everything
##col.axis, col.lab, col.main, col.sub, col.bg etc.

##Can also do the same with points and change the shape of the points aswell, specifying the point index
plot(HP, Atk, pch=8)
##pch gives the point argument

##Can also change the line type and line width with different parameters
##lty = line type, there's a chart
##lwd = relative line width

plot(uk$day, uk$Cum_Cases, type ="l",lty=3, lwd=2)

##We can also change the plotting limits of the graphs
plot(HP, Atk, ylim=c(0,100), xlim=c(0,150))

##Layout of the plots using par and mfrow

par(mfrow =c(2, 2))
##This does the same thing as above
par(add=TRUE)
##This allows for universal graphic parameters and shows us multiple graphs in one neat figure
plot(x=HP, y=Atk)
plot(x=HP, y=Def)
plot(x=HP, y=SA)
plot(x=HP, y=SD)

##Turns off the par control
dev.off()

##We can also control the level of detail in the graphs with the font size
par(cex=1.5)
plot(uk$day, uk$Cum_Cases, type ="l",xlab="DaySince31-01-2020", ylab="CumulativeCases",main="UKCOVID-19Cases",sub="datafromgov.uk")

##We can specify the size of each argument like we did last time. 
##cex.axis, cex.lab, cex.main, cex.sub

##We can also control the margin and dimension size of the plots
plot(x=HP, y=Atk, main="MainTitle")
par(mar=c(4, 4, 8, 8))
plot(x=HP, y=Atk, main="MainTitle")
par(pin=c(1,1))
plot(x=HP, y=Atk, main="MainTitle")

dev.off()

#Specify the size and name of the file
pdf(width=16, height=8,"AtkvsHP.pdf")
#alternatively try png(width=16,height=8,"HPvsAtk.png")

par(mfrow =c(1,1),mar=c(4,6,2,2)+0.1, cex=1.5) #parameter
plot(HP, Atk, ylab="HealthPoint", xlab="Attack")#plot
dev.off() #closetheplot


##Adding significant points and lines to our plots
italy<-read.csv("COVID-19_Italy.csv", header=TRUE)
france<-read.csv("COVID-19_France.csv", header=TRUE) 
#plot uk data,using red color
plot(uk$day, uk$Cum_Cases, type ="l",xlab="Days Since 31-01-2020", ylab="Cumulative Cases",col="red")
#plot italy data,using blue color,lty=2
lines(italy$day, italy$Cum_Cases,col="blue", lty=2) 
#plot france data,using green color,lty=4,lwd=2
lines(france$day, france$Cum_Cases,col="green", lty=4, lwd=2) 
#plot a point at day 100,100000 cases,using orange color
points(x=100, y=100000, pch=25,col="orange")

##We can add a straight line and a slope with a y intercept, called an abline
##Vertical line at day 100
abline(v=100) 
##Horizontal line at 500,000 cases
abline(h=500000, col="cyan")

##We can also add text annotations to our graph
text(x=100, y=300000,"day 100")
text(x=150, y=500000,"500,000 cases")

##Now we want to add a legend which gives information on the plot 
legend(0,6,
       lty =c(1, 2, 4), lwd=c(1,1,2),col=c("red","blue","green"),
       legend=c("UK","Italy","France"))

##We can use titles for multiple plots aswell, and set the title on the outer section
par(mfrow =c(2, 2), oma=c(0,0,2,0))
plot(x=HP, y=Atk)
plot(x=HP, y=Def)
plot(x=HP, y=SA)
plot(x=HP, y=SD)
title("Atk, Def, SA,SD against HP",outer=TRUE)

dev.off()

##Let us identify specific points on certain plots
plot(HP, Atk)
identify(HP, Atk, n=2, plot=FALSE)
##This returns the INDEX only of the points, let us put plot = TRUE
identify(HP, Atk, n=2, plot=TRUE)


##Let us look at more types of plots now
##Histograms
hist(HP)
##Lets specify how many breaks there are in the points between the bars
hist(HP, breaks = 40)

##Boxplots
boxplot(HP)

##Pie charts
table(Type.I)
pie(table(Type.I))




