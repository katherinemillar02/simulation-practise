
# RANDOM NUMBER GENERATION/ SEED SETTING ----

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

# APPLY FUNCTION ----
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


# GENERATING NORMAL RANDOM VARIABLES ----

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


# GENERATING RANDOM MIXTURES OF NORMAL DATA

samplea <- rnorm(1000000) 
sampleb <- rnorm(1500000, 3, 1)

combined <- c(samplea, sampleb)

plot <- ggplot(data.frame(combined), aes(x=combined)) + stat_bin(binwidth=0.25, position="identity")
plot

# two modes? 
# maybe only one mode 


plot_example2 <- ggplot(data.frame(mystery_samples), aes(mystery_samples))+
  geom_density(aes(y=..density..)) +
  stat_function(fun=function(x)dgamma(x, shape = exponentials, scale=1/rate_parameter),
                color="GREEN", size=2)



# plotting distributions on a plot together 

# first population
population1 <- rnorm(2000000) # 20 k n 

# second population
population2 <- rnorm(1000000) # 10 k n

# combining these together
combined <- c(population1, population2)

# plot example 3
plot_exmaple3 <- 
ggplot(data.frame(data=c(combined, population1, population2), labels=rep(c("combined", "pop1", "pop2"), c(3e6, 2e6, 1e6))), aes(x=data)) + stat_bin(aes(fill=labels), position="identity", binwidth=0.25, alpha=0.5) + theme_bw()

# what histogram shows 
# -  all normal distriution, but 3 different ones with pop1,2 and combined 
ggplot(data.frame(data=c(combined), labels=rep(c("combined"), c(3e6))), aes(x=combined)) + stat_bin(aes(fill=labels), position="identity", binwidth=0.25, alpha=0.5) + theme_bw()

# GENERATING RANDOM DNA STRINGS ----

# cannot get package 
# too Base R - 


# GENERATING MULTIVARIATE NORMAL CLUSTERS ----

# generating different clusters
# two clusters with 100,000 points each 

# loading in additional package: MASS
library(MASS) # package used for estimating linear models 

# making a table 
Sigma <- matrix(c(5,3,3,2),2,2) # creates a table of 2 by 2 

# running this table
Sigma # painful cap locks needed 

# generating samples 
ex1 <- mvrnorm(100000, rep(0,2), Sigma) # part of the MASS package 
# multivariate normal distribution 
# 100,000 samples 
# rep code will 

# running this 
ex1

# making a new cluster
Sigma2 <- matrix(c(9, -5, -1,5),2,2)

# running sigma code 
Sigma2

# code for new cluster 
ex2 <- mvrnorm(100000, rep(3,2), Sigma2)
# rep - creates a vector of length 2 - where both elements have the value of 3? 

# running new cluster 
ex2

# PLOTTING CLUSTERS TOGETHER 

# ggplot
# geom_density2d 


# MONTE CARLO SIMULATIONS ----
   # computing the probability of events using simulation 

# roll 2 fair dice - prob that sum of 2 dice = 7
# simulate multiple throws of 2 fair dice, fraction of THESE - that the sum is 7 

# function should 
# - simulate the trials - return TRUE if sum is 7, FALSE if not 

dice_trial <- function(dicenumber, sidenumber, target, trialnumber) {
  apply(matrix(sample(1:sidenumber, dicenumber*trialnumber, replace = TRUE), nrow = dicenumber, 2, sum)) >= target
}

# code broken

# setting the seed for repeatability 
set.seed(0)

outcomes <- dice_trial(2, 6, 7,5)

mean(outcomes)



# GAMMA DISTRIBUTION SAMPLING: GENERATING POISSON DISTRIBUTION ----

# GENERATING INFORMATION OF POWER OF STATISTICAL TESTS ----



                  
                  