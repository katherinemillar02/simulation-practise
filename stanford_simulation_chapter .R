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

head(x2)

