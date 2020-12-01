library(tidyverse)
library(ggplot)

#1.1. Variables in R

a <- 5.0
c <- 10
t <- 12
B <- a+c/t
B

vec_1 <- c(44, 5, 0, "k")
vec_2 <- c(1, 2, 3, FALSE)
vec_3 <- c("a", "b", "c",TRUE)
vec_4 <- c(1, 2, 3, "4")
#The reserved word typeof will return the data types that belongs to each vector above
typeof(vec_1) 
typeof(vec_2)
typeof(vec_3)
typeof(vec_4)

#1.2. Conditional Subsetting

#Given Vector
vec <- c(141.2741, 141.8392, 140.5730,NA, 141.3571, 139.8689, 137.9384, NA,139.6620, 138.2521, 138.8635, 141.3885, NA)

#1.2.1. Create a vector vec_1 with no missing values using conditional subsetting and explain your code
vec_1 <- subset(vec, vec<142)
vec_1
#This code will allow only numericals to be printed from the vector vec and all that is not numeric will not be printed

#1.2.2. Create a vector of indexes of missing values using conditional subsetting and explain your code
vec[c(4, 8, 13)]
#This code will reference to the positions 4, 8 and 13, then it will print their values

#1.2.3. Write a code to determine how many missing values are in vec
which(is.na(vec))
#How many missing values are in vec
val <- sum(is.na(vec))
val
#This code goes back to the vector vec to check how many missing values are in vector vec

#1.2.4. Write a R code to create a data frame which contains details of 3 students
df <- data.frame("Name"= c("Tsholofelo", "Thuto", "Gary"),
                 "Surname"= c("Dito", "Fenga", "Masupha"),
                 "Age"= c(20, 21, 21),
                 "Gender"= c("Female", "Male", "Male"))
df

#2. Functions in R 
#2.1. Create a function which returns a mean of an input vector and explain your code
x <- c(2,3,4,1,5,6)
mean(x)
#x contains values I inputed and the values will be computed with the mean(x) code

#2.2. Create a function which take no inputs , it reads a Titanic .csv file and returns its content and explain your code.
df <- tibble(read.csv("titanic.csv", sep=",")) %>% head()#This code allows me to organise the data from Titanic.csvfile
df
#I downloaded the titans.csv file from the link: https://gist.github.com/michhar/2dfd2de0d4f8727f873422c5d959fff5
#The I opened the file which was WinRAR stack then I extracted it to a folder where I linked my github to
#I then open the excel file and re-saved the file as a CSV (Comma delimited)
#I then refreshed the file folder on Rstudio 
#Then the Titanic.csv file showed on the file folder

#3. Conditionals and Loops

#3.1. Write a function that take an input below and returns a transformed vector below into 1 when its element is male and 2 when its female using ifelse.
g <- c("MALE","FEMALE","FEMALE","MALE","FEMALE","MALE","MALE","FEMALE", "MALE","MALE","FEMALE","MALE","MALE","FEMALE","MALE","MALE","MALE")

#3.2. Generate x from normal distribution and sample with replacement "M" and "F" for male and female respectively by running the code below.

x <- rnorm(1000, 120, 5)
y <- sample(c("M","F"),size = 1000, replace = TRUE)

#3.2.1. Use the "cbind " function in R to create one dataset and assign it to df.
df <- cbind(x, y)
df

#3.2.2. Convert df from 3.2.1 into a data.frame
df <- data.frame((df = cbind(x, y)))
df

#3.2.3. Write a code using tidyverse to compute a number of males ("M") and females ("F") in 3.2.1
#Number of males are :
nrow(df %>% select(x, y) %>% filter(y == "M"))
#Number of females are :
nrow(df %>% select(x, y) %>% filter(y == "F"))

#3.2.4. Create a bar plot using ggplot to visualize your results in 3.2.3
df_results <- ggplot(data = df)
df_results + geom_bar(mapping = aes( y=y))
