# THE SAMPLE FUNCTION -----

# coin as an example 
coin <- c("heads", "tails")

# selecting one of heads or tails
sample(coin, size = 1)

# groups as an example 
groups <- c("kick", "receive")

# selecting one of kick or receive 
sample(groups, size = 1)

# selecting eight of kick or receive 
sample(groups, size = 8, replace = TRUE)

# without replace = TRUE 
sample(groups, size = 8) # does not work - as only two elements to choose from 



# THE IF/ IF ELSE STATEMENT ----

# using 'if'
if_test <- function(x) { 
  if (x > 0 ) {
    return("positive")
  }
}

# this labels the function as if.test
# then says if x is more than 0 than return a positive

# checking with the number 3 is more than 0
# will return a positive as x is more than 0 
if_test(3)

# checking with -3
# does not return anything because not more than 0 
if_test(-3)

# using print function just to show it can return something 
print(if_test(-3))
# returns null 

# trying the if function again this time with more or equal to 0 
if_test_2 <- function(x) {
  if ( x >= 0) {
    return("positive")
  }
}

# testing 0
if_test_2(0)
# says is positive 

# testing -0.1
print(if_test_2(-0.1))
# negative as is less than 0 

if_test_3 <- function(x) {
  if (x > 0) {
    return("positive")
  }
  if (x < 0) {
    return("negative")
  }
}

# testing the function for positive
if_test_3(2)

# testing the function for negative
if_test_3(-2)

# getting a print value - as 0 will not give a value
print(if_test_3(0))

# trying an IF ELSE function

if_test_4 <- function(x) {
  if ( x > 0) {
    return("positive")
  } else if (x < 0) { # otherwise instead of another function
    return("negative")
  }
}

# testing for positive 
if_test_4(3)

# testing for negative
if_test_4(-3)

# CONSIDERING 0 IN THE CODE
if_test_5 <- function(x) {
  if (x > 0) {
    return("positive") } 
  else if (x < 0) {
    return("negative") }
  else if (x == 0) {
return(" neither positive or negative")
  }}

# testing the numbers +/-/+- 
# looking for positive
if_test_5(4)  
# looking for negative
if_test_5(-4)
# looking for neither positive or negative 
if_test_5(0)


# COMPARING STRINGS ----

# looking a 'counties' - correct to city 

county <- function(x){
  if(x=="Somerset"){
    return("Wells")
  } else if (x=="Norfolk") {
    return("Norwich")
  } else if (x=="London") {
    return("City of London")
  } else { 
    return('IDK!')
  }
}

# loading tidyverse package to try tibbLe - SIMULATIONS
library(tidyverse)

# making a tibble 
students <- tibble(
  name <- c("Katie", "Georgia", "Aaron"),
  county <- c("Somerset", 'Norfolk', "London"), 
  city <- c("Wells", "Norwich", "City of London")
  
)

# running the tibble 
students




# FOR loops ----
# conditional execution - simulate - betting game on coin

# loading package in 
library(tidyverse) # need functions from tidyverse

# function - with a string argument 
# side of coin showing and result of bet 

# the game 
# heads: get 2 dollars
# tails: lose 1 dollar 

# writing the function/ simulation 
flip_one <- function(x) { 
  if ( x == "heads") {
    return(2)
    } else if (x == "tails") {
      return(-1)
    }
  }

# simulating a print of the code 
c(flip_one("heads"), flip_one("tails"))
# 2 -1
# shows 2 for heads and -1 for tails 

side <- c("heads", "tails") # generating a simulation for a side of a coin
# just for heads and tails 

# combining flip one function simulation with 1 sample of side of a coin
flip_one(sample(side, size = 1)) 
# will get different result for flipping coin 
# result shows what money you lose 

# simulating code again without sides variable 
flip_one(sample(c("heads", "tails"), size = 1))
# generates the same bet results 

# simulating a game again 
# betting game with multiple rounds
# combining function AND sample()

betting_one <- function() {
  x <- sample(c("heads", "tails"), size = 1)
  if( x == "heads")
    return(2)
    else if ( x == "tails") {
      return(-1)
      
    }
}

betting_one() # running function with sample()
 # -1 comes out on top one 
# Using R to see which one is more often in the simulation 

# trying for loop
for(hand in c("rock", "scissors", "paper")) {
  print(hand)
}

# give hands - give actions - print will just reprint this 

# trying this with seasons 
for (season in c("autumn", "winter", "spring", "summer")) {
  print(season)
}


# learning to repeat an action - use pair of numbers 
# start: end 

# using numbers 1 - 5
1:5
# gives 5 numbers: 1, 2, 3, 4, 5

# numbers 30 - 20 
30:20
# goes down in order

# labelling numbers to letters 
a <- 18
b <- 7

# using letters to use pair of numbers (but with coded numbers)
a:b

# switching 
b:a

# using for loop with a simulation 
for (i in 1:5) {
  print(i)
}

# prints in down list 


# combining for() and betting round

for (i in 1:10) { # asking for 10 values 
  print(betting_one()) # uses betting one function for where to get values from 
  
}


# if coin is flipped 10 times these will be the results (gains and losses) of the bet 

#betting_one() self contained and doesn't contain anything in the function 
# but is a function that calls SAMPLE - randomness 
# running each time will show 10 different results each time 

# recording outcomes --

# results will go once the function/ simulation is run again - results can be stored 
# create a vector 

# state the rounds of the game 
rounds <- 10

results <-vector("integer", rounds) # making results VECTOR - stating it as an integer and stating n as what was labelled for rounds 

for (i in 1:rounds) {  # results should be 1 - 10 (rounds)
  results[i] <- betting_one()  # use the function simulation of betting_one data
}

# running data 
results

# This is a LOOP with actions of 
# - running a function
# - stoting results into i 

# TIDYVERSE can make simulations - avoiding writing many for loops 


# REPLICATES AND OUTCOMES ----

