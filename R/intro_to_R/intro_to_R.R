
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


##########
# SESSION 1 - GETTING FAMILIAR WITH R AND R STUDIO ENVIRONMENT
##########

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

###
# R studio environment 
# running code from script: ctrl + enter, highlight + enter
# running code from console: enter
# interface: script, console, global environment

####
# R as a fancy calculator 
2 + 2
7-5
4/2
8*5

####
# R is an object oriented programming language
# Object-oriented programming (OOP) is a programming language model organized around objects rather than 
# "actions" and data rather than logic. 

# Create and object with '=' and '<-'
object <- 2+2
object

object_2 <- 3+3
object_2

# Objects can interact with each other 
object + object_2

# Values in object can be overridden
object <- 15

# Objects and store "string"s too
string_object <- 'hello'

###
# saving objects 

# as an R data image 
save.image('my_first_objects.RData')

# as an rda file 
saveRDS(object_2, 'object_2.rda')

##########
# SESSION 2 - READING AND EXPLORING DATA (kaggle.com/datasets)
##########

####
# reading data from your local computer

# identify our working directory
getwd()

# our data is not in that path - we need to change our working directory to the 'data' folder
setwd('/home/benbrew/Documents/databrew/R/intro_to_R/data')

# read in data using read.csv
dat <- read.csv('college_all_ages.csv')

# read in .txt file 
dat <- read.table('college_all_ages.txt')

# need to tell R how the values are seperated
dat <- read.table('college_all_ages.txt', sep = ',')

# need to tell R to add a header
dat <- read.table('college_all_ages.txt', sep = ',', header = TRUE)

####
# getting data from an R package

# this in console (only once!) 
# install.packages('fivethirtyeight')

# acces library 
library(fivethirtyeight)

# view datasets provided by 538
data(package = "fivethirtyeight")

# rename college_all_ages data set to dat
dat <- college_all_ages

# link to data description
# https://github.com/fivethirtyeight/data/tree/master/college-majors

###
# data types - numeric, character, factor

# structure of data

# changing data types 


###
# basic R functions for exploring data 

# dims, ncol, nrow

# towlower, colnames, names

# max, min, mean 

### 
# subsetting data

### 
# conditional statements 


