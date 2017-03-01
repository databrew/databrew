
# This script will be used to navigate through out introduction to R course. 

# Course Instructor: Ben Brew

# Course Outline: 
# Session 1: Getting familiar with RStudio (90 minutes) 
# Useful packages (installation and accessing library)
# R Studio environment
# How to talk with R
# Exploring objects, saving objects
# Workflow, projects
# First R program
# Session 2: Reading in and exploring data (120)
# Flat files
# Using packages to get data
# R syntax - dollar sign, subsetting, brackets
# base R functions - ifelse, nrow, ncol, names, gsub, tolower, etc (how to access their options)
# Session 3: Manipulating data (120)
# Split, apply, combine
# Dplyr
# Writing data
# Session 4: Visualizing data (90)
# ggplot2
# Session 5: Statistical Analysis (90)
# (Generalized) Linear model (LM, GLM)
# T test 
# predict


####################################################################################################################

# SESSION 1 - GETTING FAMILIAR WITH R AND R STUDIO ENVIRONMENT


###
# R is an open source software with access to thousand of user made packages and libraries 

# installing a package from the console 

# only once 
install.packages('package_name')

# at the beginning of any script that uses functions from this package
library(package_name)

# packages we will use today
# ggplot2
# dplyr 
# reshape2

##########
# R studio environment 
##########
# running code from script: ctrl + enter, highlight + enter
# running code from console: enter
# interface: script, console, global environment


##########
# R as a fancy calculator
##########
2 + 2
7-5
4/2
8*5

##########
# R is an object oriented programming language
##########

# Object-oriented programming (OOP) is a programming language model organized around objects rather than 
# "actions" and data rather than logic. 

# Create and object with '=' and '<-'
a <- 2+2
a

b <- 3+3
b

# Objects can interact with each other 
a + b

# concatenating numbers 
a <- c(1,3,5,7,9,11)
b <- c(2,4,6,8,10,10)

# add them together
a + b

# print the 2nd element in each object
a[2]
b[2]

# print the 1-4 elements 
a[1:4]
b[1:4]

# add together the 3rd and 5th element
a[3] + b[5]

# communicating with R 

# Objects and store "string"s too
d <- 'hello'

# same as 
d = 'hello'

# concatenating strings
d <- c('hello', 'hi', 'how are you')

# get 'a's' length
length(d)

# how many characters
nchar(d)

# get the 2nd element
d[2]

###

# ask R questions - is the 2nd element in 'd' 'hi' (do not use '=' as this is equivalent to assigning '<-')
d[2] == 'hi'

# which element of object 'a' is equal to 3
a == 3

# which element is greater than 3
a > 3

# which elements are not equal to 3
a != 3
# or
!a == 3

# which elements are not greater than 3 (less than)
a < 3
# or
!a < 3

# which elements are less than or equal to 4
a <= 4

# add 1 to each element
1 + a

##########
# saving objects
##########

# as an R data image 
save.image('my_first_objects.RData')

# as an rda file 
saveRDS(object_2, 'object_2.rda')


##########
# YOU TRY
##########

a <- c(10, 22, 54, 4, 5, 21, 7, 19)

# get the first 3 elements of 'a'

# ask R if the 6th element of 'a' is 21

# ask R if the 5 element of 'a' is 6

# add the 2 and 5 element of a

# create a new object called 'b' and fill it with 

# replace the the 6th element of a with 8 new numbers

# add 'a' and 'b' into a new object

# find elemnts of that object that are not equal to 10

# find elements of that object that are greater than 3


# STOP HERE AND WAIT FOR SESSION 2



###############################################################################################################

# SESSION 2 - READING AND EXPLORING DATA (kaggle.com/datasets)

###########
# getting data from an R package
###########

# type following line into console (only once) 
# install.packages('fivethirtyeight')

# acces library (run this line everytime you open R studio)
library(fivethirtyeight)

# view datasets provided by 538
data(package = "fivethirtyeight")

# rename college_all_ages data set to dat
dat <- college_all_ages

# link to data description
# https://github.com/fivethirtyeight/data/tree/master/college-majors

##########
# reading data from your local computer
##########

# identify our working directory
getwd()

# our data is not in that path - we need to change our working directory to the 'data' folder
# we can use the setwd fuction
setwd('/home/benbrew/Documents/databrew/R/intro_to_R/data')

# read in .txt file with read.table function
dat <- read.table('college_all_ages.txt')

# because the data is seperated by ',' we need to add that argument to the function
dat <- read.table('college_all_ages.txt', sep = ',')

# need to tell R to add a header and to 
dat <- read.table('college_all_ages.txt', sep = ',', header = TRUE)

# read in data using read.csv
dat <- read.csv('college_all_ages.csv', stringsAsFactors = F)


##########
# structure of data and data types - numeric, character, factor
##########
str(dat)

# Integers cannot take decimal or fractional values, while numerics can, but no real practical difference.
summary(dat)

# we can look at individual columns using the '$' operator or by selecting the position of the column
summary(dat$Employed)

# Factors have predetermined levels, whereas characters are simply strings. R will treat them the same 
# when doing most statistical anlaysis, but they are entirely different when manipulating data frames.
summary(dat$Major_category)
# R doesnt know how to summarize a string variable

# but if we chang from sting (character) to a factor, R can summarize
dat$Major_category <- as.factor(dat$Major_category)
# for numeric: as.numeric()
# for character: as.character()

# now doing a summary of that column will give us a more useful answer
summary(dat$Major_category)

##########
# basic R functions for exploring data 
##########

# dims, ncol, nrow
dim(dat)
ncol(dat)
nrow(dat)
length(dat$Employed)

# colnames, names
colnames(dat)

# print 5th column
colnames(dat)[5]

# max, min, mean of unemployment rate column
max(dat$Unemployment_rate)
min(dat$Unemployment_rate)
mean(dat$Unemployment_rate)

##########
# YOU TRY
##########

# print the name of the 3rd column

# what is the mean of the column "Total" 

# Get a summary of the "Major_category" column (hint: you need to convert it to a factor variable)

# subtract "Employed" column from "Total" column 

# now assign that subtraction vector to a new column 

###############################################################################################################

# SESSION 3: MANIPULATING DATA

#########
# make the column names 
#########

# first you need to acces the column names with the colnames function
colnames(dat)

# now we can wrap the tolower function around that function to get lower case column names
tolower(colnames(dat))

# we can also make them all upper case with the toupper functio
toupper(colnames(dat))

# but if we want to actually change our column names to lower case we have to overwrite the our 
# existing column names.
colnames(dat) <- tolower(colnames(dat))

##########
# conditional statements 
##########

# we can use vectorized conditional statements to recode variabes or create new ones based off old ones
# lets create a categorical (factor) variable based off the unemployment rate
# first lets get the summary of a unemployed rate
summary(dat$unemployment_rate)
# mean of around .05

# We can also visualize the distribution with a histogram
hist(dat$unemployment_rate)

# We will create a new variable that is categorical, not numeric. 
# If the number is over 0.05, we will classify it as "high_unemployment" and else it will be classified 
# as "low_employment. WE can do this using the ifesle statment
?ifelse

dat$new_var <- ifelse(dat$unemployment_rate > 0.05, 'high_unemployment', 'low_unemployment' )

# lets summarize this new variable
summary(as.factor(dat$new_var))

###
# round numeric data
# as of now, the data is represented with too many decimal points. lets round it to the nearest 10th with the round 
# function
round(dat$unemployment_rate, 3) 

# this is what we want, not lets override that column withe our new rounded values
dat$unemployment_rate <- round(dat$unemployment_rate,3)

# lets also change this variable to a percentage, rather than a rate
dat$unemployment_rate <- dat$unemployment_rate*100

##########
# subsetting data
##########

# In R we use parentheses () for functions and brackets [] for subsetting. 
# to subset data, we simply write the object followed by brackets, and then indicate 
# which row or column we would like to select. Rows are positioned on the left hand side of the 
# comman and columns on the right hand side

# for example, if we want to select the 3rd row and the 2nd column we simply write
dat[3,2]

# If we want to select one specific column, but all of the rows simply leave the left side of the comma blank
dat[,5]
# this is the same as 
dat$employed

# Simlarly, if we want to select one row but all of the columns simply leave the right side of the comma blank
dat[3,]

##########
# subsetting by row
##########
# we can subset based on a condtion using the which function
# first lets create an index based on the new variable we created.
# we will subset the data by grabbing all of the rows where our new variable is equal to 'low_employment'
dat[dat$new_var == 'low_unemployment',]

# we can assign this to a new data frame, called dat_low
dat_low <- dat[dat$new_var == 'low_unemployment',]

# lest break down what we just did 
dat$new_var == 'low_unemployment'
# this returns a vector of TRUE and FALSES 
# when put inside of the [] it keeps only the rows for which there is a TRUE value.
# and because the right hand side of the comma is empty, we grab all of the columns. 

##########
# subsetting by columns
##########

# lets grab the first 4 columns
dat[, 1:4]

# lets grabe the first 4 columns and the 10th column
# we have to use c() to concatenate the columns
dat[, c(1:4, 10)]

# we can also explicitly name the columns we want
# lets take a look at the column names
colnames(dat)

# again, grab the first 4 columns and the 10th column
dat[, c('major_code', 'major', 'major_category', 'total', 'p25th')]


##########
# gsub, strsplit, grepl
##########
?gsub


# dplyr

# writing data

##########
# SESSION 4: VISUALIZING DATA
##########
install.packages('ggplot2')
library(ggplot2)

##########
# SESSION 5: STATISTUCAL ANALYSIS
##########






