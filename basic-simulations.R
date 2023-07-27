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

# using pnorm() function - evaluate the cumilitive distribution
# probability of a random normal variable being less than x 

# e.g. using 2 
pnorm(2)

# SETTING A NUMBER SEED

set.seed(1)

# run it multiple times, will get different numbers each time 
rnorm(5)
# where mean is 0 and sd is 1 

# keep running rnorm to get different set of numbers 
# re-run set.seed again, get same original set of numbers 

# using rpois (discrete data)

rpois(10, 1) #  will give 10 numbers with a mean of 1

rpois(10,2) #  will give 10 numbers with a mean of 2

rpois(10,20) #  will give 10 numbers with a mean of 20


# SIMULATING A LINEAR MODEL 
`
# setting the seed 

set.seed(20) # setting repeatability 

# simulating a PREDICTOR variable 

x <- rnorm(100) # 100 random numbers with a mean 0, sd 1 

e <- rnorm(200, 0 , 2) # 200 random numbers with a mean 0, sd 2

y <- 0.5 + 2 * x + e

summary(y)

plot(x, y)




# binomial distribution 
set.seed(10)

x <- rbinom(100, 1, 0.5) # n, size, prob

str(x) # structure of R objects 

e <- rnorm(100, 0, 2)

y <- 0.5 + 2 * x + e 


