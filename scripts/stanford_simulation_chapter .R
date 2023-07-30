# Simulating data with R - using RNG of different kinds of variables 


vector_poission <- rpois(100, 5)
# setting an object 
# poisson distribution of 100 values with a mean of 5 

# generating a mean average of this
mean(vector_poission)
# get a different number each time 

# setting the seed for repeatability 
set.seed(437842)

# labelling a poisson distribution 
# 100 with a mean of 5
vector_poission <- rpois(100, 5)

# mean value of this 
mean(vector_poission)
# different number? 

# APPLY FUNCTION 
# the sum of exponential gives a gamma distribution?? confirmed by simulation, covering helpful functions in R 

# want to AVOID for() loops , this is slower than working with apply()

# generate 5 samples from an 'exponential' with a rate parameter 0.1 - sum them together 

replicates <- 5000 # number of replicates 
exponentials <- 5 # number of exponential random variables in simulation 
rate_parameter <- 0.1 # the rate parameter 

# using set.seed for repeatability 
set.seed(0)

system.time( # measures execution time of how long code takes to run
  
  # from here is actual simulation code
  # labelling it as 'x1' 
  x1 <- replicate( # replicate will repeat a given expression
    replicates, sum(rexp(n=exponentials, rate = rate_parameter))
  )
)

# viewing data 
head(x1)

# viewing the frequency distribution 
library(ggplot2)

# making a plot 

plot_example <- ggplot(data.frame(x1), aes(x1))+
  geom_histogram(aes(y=..density..)) +
  stat_function(fun=function(x)dgamma(x, shape = exponentials, scale=1/rate),
                color="red", size=2)

# frequency disributions 
# positive distribution  

# LOOKING AT THIS FUNCTION

help(replicate)
# lapply(), sapply(), vapply()
# lapply returns a list of the same length as X, each element of which is the result of applying FUN to the corresponding element of X.

# related to functions apply() and tapply()

# trying sapply() instead 

# setting the seed for repeatability 
set.seed(0)

# using system time to measure code one 
system.time(
  x2 <- sapply # simplified version of lapply 
  (1:replicates, # meaning the values will be from 1: 5000 - determines how many times simulation is repeated
    function(i) # stand alone function? single function? 
      {sum(rexp(n = exponentials, rate= rate_parameter))})) 

# viewing the data 
head(x2)

# trying lapply() function
# gives in a list instead of simple 
system.time(
  x3 <- lapply(
    1: replicates,
    function(i)
    {sum(rexp(n = exponentials, rate = rate_parameter))}
  )
)



# viewing the data 
head(x3)

# applying a very simple function such as sum() - 
# make a matrix of all simulations, apply them to the functions appropriatley 
# use rowSums() and colSums()

# setting seed - so same each time 
set.seed(0)

# apply will apply the function to specified margins within the matrix 
system.time( 
  x4 <- apply( # using apply() function 
    matrix( # matrix() is __ filled with random numbers from a exponential distribution - should give columns 
      rexp(n = exponentials * replicates, rate = rate_parameter),nrow = exponentials,) ,# will generate exp * reps with specified rate parameter 
       2, sum)) # applies sum function to columns of matrix 
# 2 is default usually - so separating another 2 - is 4 


# viewing the data 
head(x4)

# loading in more packages 
library(parallel)

# setting the seed for repeat
set.seed(0)

# using mclapply - will give a list 
system.time( 
  x5 <- mclapply(1:replicates, function(i) { # include function in this code 
    sum(rexp(
      n = exponentials, rate = rate_parameter
    ))
  }
    
  )
)

# viewing the data 
head(x5)


# GENERATING NORMAL RANDOM VARIABLES 

# genrating samples 
samples1 <- rnorm(100)
samples1



# checking these have mean 0 and sd 1 with qq plot 
load("data/mystery_samples.RData")

# reading the data in 
mystery_samples <- samples

head(mystery_samples) # gives first n values 

# 
hist(mystery_samples)

plot_example <- ggplot(data.frame(mystery_samples), aes(mystery_samples))+
  geom_histogram(aes(y=..density..)) +
  stat_function(fun=function(x)dgamma(x, shape = exponentials, scale=1/rate),
                color="red", size=2)

# normal distribution? 
library(vcd)

# working out which distribution the samples come from 
distplot(mystery_samples)
