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

# using replicate to repeat a simulation 

# labelling rounds again 
rounds_2 <- 10

# new results code
results_2 <- replicate(10, betting_one())
# using replicate (10) and betting one function to repeat function 10 times
# gives 10 results of the betting one function 

sum(results_2) # this with the new results_2 code 
# this shows we have lost money? if we do the bet 10 times 
# but code for replicate contains a for loop

# doing a different number of rounds 
rounds_3 <- 1000 

# doing new results code with rounds_3 in the code 
results_3 <- replicate(rounds_3, betting_one())

# confirming the length - amount of rounds peformed 
length(results_3)

# measuring the total of money earned after 100 rounds of this game 
sum(results_3)

# visualising the results of this simulation 

# loading ggplot package in 
library(tidyverse)

# making a tibble/ table of these results 
results3_table <- tibble(results_3)

# visualising plot 
ggplot(results3_table, aes(results_3)) + # using made tibble 
  geom_bar() +
  coord_flip()
# both are the same? 

# SIMULATION RECIPE 
# programming - physical process

# SIMULATIONS WITH TIDYVERSE 

# using sides of a coin
sides <- c("heads", "tails")

# make a sample simulation - 8 tosses
tosses <- sample(sides, size = 8, replace = TRUE)
# this code tosses a coin 8 times, shows the results

# trying code
tosses

# using sum with toss code to see how many times 'heads' will be shown
sum(tosses== "heads")

# the sum of tails
sum(tosses == "tails")

# half and half 

# trying 100 tosses instead of 8
tosses_2 <- sample(sides, size = 100, replace = TRUE)

# trying code 
tosses_2

# seeing sums of heads and tails again

# heads
number_of_heads <- sum(tosses_2 == "heads")  
number_of_heads
# tails 
tails_sum <- sum(tosses_2 == "tails") 

#  code always seens to be the same 
# REPLICATE will elimiate the need to do for loops


results_5 <- sample(sidez, size = 100, replace = TRUE)
# works 

heads_sum <- sum(results_5 == "heads", replace = TRUE)

one_experiment <- function() {
  results_5  <- sample(sidez, size = 100, replace = TRUE)
  heads_sum <- sum(results_5 == "heads")
  return(head_sum)
}

one_trial <- function() {
  outcomes <- sample(sides, size = 100, replace = TRUE)
  num_heads <- sum(outcomes == "heads")
  return(num_heads)
} 

one_experiment()


# still shows 51 but this time from one code 

# using nrep with replicate to run code 1000 times 

rep_n <- 10000

# repeating the above simulation 10 k times
second_experiment <- replicate(n = nrep, one_experiment())
# FIXED - REMEMEBR ()

second_experiment # still the same 

head(second_experiment)

# testing to see if it is run 10,000 times 
length(second_experiment)

# running the new 10,000 repeated simulation ? 
second_experiment[1]
second_experiment[95]
second_experiment[50]
# results seem to always be the same?

# vewing this data in a tibble
results_table <- 
  tibble(
    replicates = 1:rep_n, 
    views = second_experiment
  )
  
# running code 
results_table

# visualising the different results with a plot 
ggplot(results_table)+
  geom_histogram(aes(x = second_experiment, y = after_stat(density)),
                 colour = "red", fill = "green",
                 breaks = seq(30.5, 69.6, 1))
# only coming up with 51? 
# error with code 

# 
# trying to troubleshoot to understand why the simulated numbers aren't being replaced 
sides <- c("heads", "tails")

# CODE THAT WORKS BUT GO BACK AND EDIT 
tosses <- sample(sides, size = 8, replace = TRUE)

tosses 

sum(tosses == "heads")

outcomes <- sample(sides, size = 100, replace = TRUE)

num_heads <- sum(outcomes == "heads")

num_heads

one_trial <- function() {
  outcomes <- sample(sides, size = 100, replace = TRUE)
  num_heads <- sum(outcomes == "heads")
  return(num_heads)
} 
one_trial()
# Number of repetitions
num_repetitions <- 10000

# simulate the experiment!
heads <- replicate(n = num_repetitions, one_trial())
length(heads)
heads[1]
heads[6]
# different values 
heads
# THIS CODE CHANGES !!!!!!!
library(tidyverse)
# putting these results into a table 
results_table <- tibble(
  repetition = 1:num_repetitions, 
  num_heads = heads
)

# running table 
results_table

# visualising data 
ggplot(results_table) +
  geom_histogram(aes(x = num_heads, y = after_stat(density)),
                 colour = "green", fill = "red",
                 breaks = seq(30.5, 69.6, 1))+
  theme_classic()
# this plot shows if the coin is thrown 1000 times 
# how many times heads will be thrown... over 100 

# explaining histogram 
# bins have a width of = 1
# e.g. bar on 50 - the amount of times the simulation generated 50 as the result

# there is SYMMETRIC DISTRIBUTION
# symmetric distribution is particulary good here; 
# 100 tosses = 50 heads 
# shows number of heads will be between 35-65


# simulating - doubling

# using an example of 'counting grains" 

# using sample function - look at count with PROB of count
sample(c(-1,0,1), 1, prob = c(1/4, 2/4, 1/4)) 
# counting one less (-1) = prob of 1/4 
# counting right (0) = prob of 2/4
# counting one more (1) = prob of 1/4 

# Gives 0 as the result but this can change 
# most likely to be 0 as the prob = 2/4 

# simulating a function for this 
# argument - number of grains 
# return - number of grains from counter's calculation 
# total amount received 

# writing the function
clerks_calculation <- function(grains) { # putting grains as a value in function 
  grains + sample(c(-1,0,1), 1, prob = c(1/4, 2/4, 1/4))  # putting sample probability in function
}

# running the function - giving amount of grains 

# running code multiple times shows counted 9-11 
# sometimes undercounted and sometimes overcounted
# lines up with the function/ probability 


# 2 ^ day number 1 - writing this form in code 
2 ** (0:9)
# this is actually day 1 - 10 but considers (-1)

# shows how many received after each day - obviously increases 

# using purr (from tidyverse) - gives frames 

# using purr - map to simulate amounts after clerk's simulation

# loading package in 
library(purrr)

# 
map_dbl(2 ** (0:9), clerks_calculation) # applys function to each vector 
# gives similar results to just 2 ** (0:9)

# then using this map-dbl function to get a sum
# code option 1 
map_dbl(2 ** (0:9), clerks_calculation) |> sum()
# code option 2 
sum(map_dbl(2 ** (0:9), clerks_calculation))

# both of these work 
# code simply adds the grains from all days up? but what the point 

# writing function for OVERALL grains over 10 days 
overall_grains_received <- function(days) {
  sum(map_dbl(2 ** (0:9), clerks_calculation))
  
}
# running code - over 10 days - the grains received 
overall_grains_received(10)
# gives different outcome

# my confusion atm - i thought the 2 ** (0:9) gives grains + grains from the day before 
# otherwsie why is there so much difference in each day 
# the total isnt really the total? 

# Looking at variability of the simulation 
repetitions <- 1000
# using replicate to simulate experiment (with repeats)
grains <- replicate(n = repetitions, overall_grains_received(10))
# code will do the 10 day function simulation but will give 1000 results 

# putting these repeats into a tibble table
results_table <- tibble(
  repetition = 1:repetitions,
  grain_number = grains
)

# running table 
results_table

# visualising these results 
ggplot(results_table) +
  geom_histogram(aes(x = grain_number, y = after_stat(density)),
                 colour = "black", fill = "green", bins = 18) +
  geom_point(aes(x = 1023, y = 0), colour = "yellow", size = 3)+
  theme_classic() 
# call the own average 1023 - where the point is 
# results are affected by the doubling effect 

# Accumulation - instead of doubling effect
# updating values as going along - errors are not independant

# simulation that updates values as going along 
# for loop is a possibility for this but requires lots of line of code 
# PURRR - accumulate - applies a 2 argument function to elements of a vector 
# EACH application of the function - result - of the prev application as the first argument 

# using an example with fruits 
# Labelling fruits 

fruits <- c("apple", "orange", "strawberries", "grapes")

# accumulation with strings 
# function that receives 2 arguments 
# acc = accumulator 
# nxt = next element in the input vector 
# str_c = two arguments, colon as a separator - joins all results 

# using function together 
accumulate(fruits, \(acc, nxt) str_c(acc, nxt , sep = ":")) |> last()
# or 
last(accumulate(fruits, \(acc, nxt) str_c(acc, nxt , sep = ":")))

# this code generates the codes put into fruits  a : format 

# to see that something is accumulating, can use a value to show this
accumulate(fruits, \(acc, nxt) str_c(acc, nxt, sep = ":"), .init = "a")
  # shows how it accumulates over time 

# can sometimes not use nxt - if you don't want the number of steps 

# looking at numbers with accumulate and adding 10 each time
accumulate(541:546, \(acc, nxt) acc + 10, .init = 10)
# ACCUMULATION of 10 each time 

# testing accumulation - termination? 
accumulate(1:6, \(acc, nxt) acc + 10, .init = 10)
# still the same - DOES NOT CHANGE 

# accumulate can also be used for DOUBLING, like previous 
# one ERROR will cause affect for the days after (2nd scenario)

# using grain data for accumulation 


accumulation_grains <- function(grains_now) {
  grains_new <- grains_now + clerks_calculation(grains_now)
  return(max(1, grains_new))
}

accumulation_grains()

# code brokem 

# REPLICATES AND OUTCOMES ----




