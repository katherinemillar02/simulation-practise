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
exponentials <- 5 # number of exponential
rate_parameter <- 0.1 # the rate parameter 

# using set.seed for repeatability 
set.seed(0)

system.time(
  x1 <- replicate(
    replicates, sum(rexp(n=exponentials, rate = rate_parameter))
  )
)

