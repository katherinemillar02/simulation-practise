# practicing some random selection 


# generating random numbers 
# random number generator is 1 
set.seed(1)
# ensures reproducibility 

# using the sample function 
sample(1:10, 4)
# this wll select 4 numbers from 1-10

# using this for letters 
sample(letters, 4)
# this will select 4 random letters

sample(1:10)
# simple code, will just select 10 numbers 1-10 in a random order 

sample(1:10, replace = TRUE)
# this means there will be repeats of numbers

# simulating normal random numbers
# using mean of 0, and a standard deviation of 1 
x <- rnorm(10)
# 10 random numbers


# setting a mean and sd 
x <- rnorm(10, 20, 2)
# setting a mean of 20 and an sd of 2 

# getting some statistical values 
summary(x)
