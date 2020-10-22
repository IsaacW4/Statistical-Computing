#Object types and data structures, and also syntax
#There are 6 object types in R
#Numeric e.g. 2, 3, 4, 5
#Integer e.g. 2L, 18L (The L tells R it's an integer)
#Character e.g. "Hello world" "Hello" "World"
#Logical e.g. TRUE, FALSE, NA
#Complex e.g. -1+2i, 3+4i

7 - 5L
2 + TRUE
5 - FALSE
#TRUE = 1, FALSE = 0 

#Charater objects 
paste("Mon", "day", sep = "")
paste("Jan", "Feb", "Mar", "Apr")

#Extracts part of a string
substr("long long time ago", start=5, stop=9)

#Replacing characters
sub("aaabbbccc", pattern="bbb", replace="d")

# >, <, <=, >=, ==, !=, % in% are all of the operators 
# &&, ||, !, &, | are all of the logical operators 

!c(TRUE, TRUE, FALSE)
c(TRUE, TRUE, FALSE)

c(TRUE, TRUE, FALSE) && c(FALSE, TRUE, TRUE)
c(TRUE, TRUE, FALSE) & c(FALSE, TRUE, TRUE)

#Checking different types of object types
is.numeric("Chao")
is.numeric(3.5)
is.numeric(2*5)
is.character("Monday")
is.character(6 + 3 - 2)
is.logical(TRUE)


class("Guitar")
class(3.1)
class(2L)


is.integer(2)
is.integer(2L)
is.numeric(2L)
#You can convert between data types 

as.numeric("2.5")
pi

#Data structures in R. (Ways to store data in efficient ways) 

#Vectors
c - "Used to Combine objects"
rep - "Repeat an object a given number of times"
seq - "Generate a sequence of numbers with a fixed increment"

c(1, 2, 3, 4, 5)
rep(2, times = 6)
rep("Ha", 10)
seq(from=1, to=11, by=2)

#Factors
#Usually a categorical value 
food.vec<-c("pasta","bread","bread","noodles","pasta","pasta","noodles","pasta")
food.vec
food <- factor(food.vec)
food
levels(food)
table(food)

#Matrix
matrix(1:12, nrow=4)
matrix(1:12, nrow=4, byrow=TRUE)
matrix(c("1st", "2nd", "3rd", "4th"), nrow=2)

#Array
array(1:24, dim = c(2,3,4))
#This is multi dimensional and allows for multiple data structures to appear. 2*3*4 == 24 for this to work.

#Data Frame
#Rectangular 2 dimensional data structures 
#The Pokemon exercise was a data frame in fact, lets create another

Name <- c("Eng", "Scot", "Wales", "NI")
Population <- c(53, 5.3, 3.1, 1.8)
Area <- c(130395, 77910, 20735, 14130)
data.frame(Name, Population, Area)

#Lists
#Collect objects of different data types
x <- matrix(1:4, nrow = 2)
y<-c("good","bad","ugly")
z<-c(TRUE,FALSE)
list(x, y, z)