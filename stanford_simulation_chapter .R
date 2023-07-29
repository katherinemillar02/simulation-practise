# Simulating data with R - using RNG of different kinds of variables 


vector_poission <- rpois(100, 5)
# setting an object 
# poisson distribution of 100 values with a mean of 5 

# generating a mean averaage of this
mean(vector_poission)
# get a different number each time 

# setting the seed for repaeatability 
set.seed(437842)

# labelling a poisson distribution 
# 100 with a mean of 5
vector_poission <- rpois(100, 5)

# mean value of this 
mean(vector_poission)
# different number? 

# APPLY FUNCTION 
# the sum of exponentials gives a gamma distribution?? confirmed by simulation, covering helpful functions in R 

