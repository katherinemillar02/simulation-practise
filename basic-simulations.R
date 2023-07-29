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

# setting x (the predictor variable)
x <- rnorm(100) # 100 random numbers with a mean 0, sd 1 

# setting e (?)
e <- rnorm(200, 0 , 2) # 200 random numbers with a mean 0, sd 2

# working out y - the outcome variable with the worked out x and e 
y <- 0.5 + 2 * x + e

# generating these values
summary(y)

# plotting these variables 
plot(x, y)




# binomial distribution -----
set.seed(10) # setting repeatability 

# setting x  but using BINOM instead of normal 
x <- rbinom(100, 1, 0.5) # n, size, prob
# instead of mean uses size 
# instead of sd uses prob 

str(x) # structure of R objects 

# looking for e using normal distribution 
e <- rnorm(100, 0, 2) # using mean 0, sd 1 

# working out y with new vaqlues
y <- 0.5 + 2 * x + e 

# plotting binomial data 
plot(x, y) 
# keep running to get new results 


# GENERALISED LINEAR MODELS -- SIMULATIONS 

# set the seed 
set.seed(1)

# simulate a predictor variable 
x <- rnorm(100)

# setting log.mu 
 log.mu <- 0.5 + 0.3 * x 

 # using rpois()
y <- rpois(100, exp(log.mu))

# getting results from rpois()
summary(y)

# plotting the data 
plot(x,y)

# RANDOM SAMPLING ----

# setting the seed for repeatability 
set.seed(1)

# using the sample function 
sample(1:10, 4) # this will select 4 numbers from 1-10

# using this for letters 
sample(letters, 4)
# this will select 4 random letters

sample(1:10)
# simple code, will just select 10 numbers 1-10 in a random order 

sample(1:10, replace = TRUE) # changing the numbers 
# this means there will be repeats of numbers


# adding ones own data 

# reading in packages 
library (readxl)

# reading in data 
parkrun <- read_excel("data/ parkrun-times-2.xlsx)

#using ones own data for simulation 


