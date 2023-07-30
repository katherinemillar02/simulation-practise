# running a sequence
x1 <- 1:10

# sample will give random order 
sample(x)

sample(x, replace = TRUE) 

# generating 10 random letters 
sample(letters, size = 10)

sample(x, size = 100, replace = TRUE)

# GENERATING particular numbers 
x2 <- c(5,7,8)

# gives random order of those 3 values 
sample(x2)

# gives different values each time 
sample(x2, replace = TRUE)


# using the x2 values to 100 random numbers, generate different each time
sample(x2, size = 100, replace = TRUE)

# 6 values 
sample(x2, size = 6, replace = TRUE)

# sampling 100 values between 3 - 103 

# selecting range 
x3 <- 3:103

# code to generate values 
sample(x3, size = 100, replace = TRUE)


# LEARNING VALUES FOR DIFFERENT DISTRIBUTIONS 

# NORMAL DISTRIBUTION

# generating 100 values
# mean 0 sd 1 (default)
rnorm(100)

# generating 50 values
# mean = 10, sd = 5
rnorm(50, 10, 5)

# POISSON DISTRIBUTION 
# ask for the amount (n) and lambda 

# generating 1000 values
# lambda 50
rpois(1000, 50)

# UNIFORM DISTRIBUTION 
# generate 30 values 
# min 0 , max 10 
runif(30, 0, 10)

# ---- LEARNING TO REPEAT 

# replicate() can be used with n (the amount of times), then the expression

# replicate normal distribution 
# rnorm with 10 repeats, mean 0, sd 1 
# repeated 100 times 
replicate(100, rnorm(10))

# breaking it down 
# normal distribution 10 values 
rnorm(10)

# giving one mean of these 10 values
mean(rnorm(10))

# 10 repeats of 100 rnorm values 
replicate(10, rnorm(100))

# making a histogram of this distribution 
hist(replicate(10, rnorm(100)))

# replicate 1000 times the mean of 10 values drawn from a uniform distribution between 0 and 10  
replicate(1000, mean(runif(10, 0, 10)))

# viewing this in a histogram
hist(replicate(1000, mean(runif(10, 0, 10))))

# LEARNING TO SET THE SEED 

# without the seed set? 

# setting seed for repeatability 
set.seed(10)

# using histograms as an example 
hist(replicate(10, mean(rnorm(10))))
# you get a different one each time as seed is set 


# setting seed for repeatability 
set.seed(10)

hist(replicate(10, mean(rnorm(10))))
# run it again get back to original one 


# defining sample size 
# replication (n) and the number of simulation/repeats/replication (nrep)
# single random sample of normal distribution with n = 10

# setting the seed for repeatability 
set.seed(10)

# setting rnorm
x4 <- rnorm(10)

# 
hist(x4, breaks = 10, col = "black", xlim = c(-4,4))  
 # breaks the data into 10 bins
# makes the x axis range from - 4 10 4 
# data only goes up to 2 but there is 10 bins - think this makes sense

# using abline code - automatically adds line 
abline(v = 0, col = "red", lty = 2, lwd = 2) # adds straight lines to a plot 

# adds a mean line 
abline(v = mean(x4), col = "blue", lwd = 2)

# legend explaining 
legend(
  0.9, 
  y = 1.5, 
  legend = c("mean(x4)", "0"), 
  lty = c(1, 2), 
  col = c("blue","red")
)

# using the repeat function for a certain simulation number 

# setting the seed for repeatability 
set.seed(10)

# repeating code 
x5_repeat <- replicate(24, rnorm(10))

# setting parameters
par(mfrow = c(3,8), mar = c(0,0,0,0))

# visualising this with a plot 

