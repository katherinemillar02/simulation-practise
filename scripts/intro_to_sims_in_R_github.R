# GENERATING RANDOM NUMBERS AND SAMPLING THEORY -----


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

# using apply() function 

x5_plot <- apply(
  x5_repeat,
  2,
  function(x) {
    # for fairly simple functions with lots of arguments, we sometimes just cram them all on the same line.
    # it's not great practice but it stops the script getting super long when dealing with graphical objects
    hist(x, col = "grey", xlim = c(-5,5), ylim = c(0,7), breaks = c(-5:5),
         main = "", ylab = "", xlab = "", xaxt = "n", yaxt = "n")
    abline(v = mean(x), col = "blue", lwd = 2)
    abline(v = 0, col = "red", lty = 2, lwd = 2)
  }
)

# trying to plot with x5 data ??
# need to work on this one 

par(
  # parameter function 
  # multiple plots on a single device 
  mfrow = c(1,2), 
  # the layout of the plots 
  # single row and two columns of plots
  mar = c(5,5,1,1))
  # margins around the plotting area 

# this code sets the layout for the histogram etc 

hist(apply(x5_repeat, 2, mean), main = "Mean", col = "grey", xlim = c(-1,1))
# making a histogram with x5 data 

abline(v = 0, col = "green", lty = 2, lwd = 2)
# adding line at 0 

hist(apply(x5_repeat, 2, sd), main = "SD",col = "grey", xlim = c(0.6,1.4))
# adding the standard deviation of the data 

abline(v = 1, col = "red", lty = 2, lwd = 2)
# adding line at one of the sd 


## 24 simulations of same distribution //  n = 1000

# setting the seed for repeatbaility 
set.seed(10)

# making the code 
x6 <- replicate(24, rnorm(1000))
# parallel // split
par(mfrow = c(1,2), mar = c(5,5,1,1))


# x6 replicate data - histogram 
# apply function with histogram and adding ablines
x6_plot <-
  apply(x6, 2,
        function(x) {
          hist(x, col = "green", xlim = c(-5,5), ylim = c(0, 500), breaks = c(-5:5),
               main = "", ylan = "", xlab = "", xaxt = "n", yaxt = "n")
          abline(v = mean(x), col = "red", lwd = 2)
          abline(v = 0, col = "yellow", lty = 2, lwd = 2)
        } )
# some errors but codes


# adding mean and sd lines
par(mfrow = c(1,2), mar = c(5,5,1,1)) # 2 plots? 

# 1st plot 
hist(apply(x6, 2, mean), main = "mean",col = "black", xlim = c(-1,1))
# apply() function , adding mean
# adding line at x = 0 
abline(v = 0, col = "red", lty = 2, lwd = 2)

# 2nd plot 
hist(apply(x6, 2, sd), main = "SD",col = "black", xlim = c(0.6,1.4))
# apply() function, 2, adding sd 
abline(v = 1, col = "red", lty = 2, lwd = 2)
# adding line at x = 1 


# simulating means and sds 
# from 1000 repeats of simulations 
# with n = 10, and the default; mean = 0, sd = 1

# setting the seed for repeatability 
set.seed(10)

x_100_repeat <- replicate(1000, rnorm(10))

# generating histograms with lines 
par(mfrow = c(1,2), mar = c(5,5,1,1))

# 1st plot 
hist(apply(x_100_repeat, 2, mean), main = "mean", col = "green", xlim = c(-1,1)) # this x axis 
# adding line 
abline(v = 0, col = "red", lty = 2, lwd = 2)

# 2nd plot 
hist(apply(x_100_repeat, 2, sd), main = "sd", col = "green", xlim = c(0.6,1.4)) # this y axis 
# adding line
abline(v = 1, col = "red", lty = 2, lwd = 2)

# GENERATING FUNCTIONS -------

# writing a function 
# nrep, replicates 

# writing own simulation
# normal distribution with 
# 10 distributions, mean = 1, sd = 2
# repeated 21 times 
own_function <- replicate(21, rnorm(n = 10, mean = 1, sd =2))

# making a histogram of this simulation 
# splitting the plots viewer up to see both plots
par(mfrow = c(1,2), mar = c(5,5,1,1))

# first plot (with mean line)
hist(apply(own_function, 2, mean), main = "own mean", col = "yellow", xlim = c(-1.5,3))

# adding mean line to this 
abline( v = 1, col = "red", lty = 2, lwd = 2)

# second plot (with sd line)
hist(apply(own_function, 2, sd), main = "own sd", col = "yellow", xlim = c(1,3))

# adding sd line
abline(v=2, col = "red", lty = 2, lwd = 2)

# modifying the histogram 
# changing code with mean 
# listing the actual values as are not default 
own_function_2 <- replicate(21, mean(rnorm(n = 10, mean = 1, sd =2)))

# histogram with mean and sd for this new code 

# split screen
par(mfrow = c(1,2), mar = c(5,5,1,1))

# general histogram code including simulation code 
hist(replicate(21, mean(rnorm(n = 10, mean = 1, sd =2))))
# or 
hist(own_function_2)

# using a nrep instead of a number 
# setting the nrep 
nrep <- 5555

# replicate code including the nrep
new_code <- replicate(nrep, mean(rnorm(555, 4, 5)))

# including new code in function to create a histogram 
histogram_normal <- 
  function(nrep) {
    hist(replicate(nrep, mean(rnorm(555, 4, 5))))
  }

# trying set code 
hist_normal_2 <- function(nrep) {
    hist(new_code)
  }  


# testing the histogram 
hist_normal_2()
hist_normal_2(100000)

# code runs number doesn't make a difference 


# doing this again but changing n 
# will compare differences of changing n 
# replicate(mean(rnorm))

# setting the nrep
nrep2 <- 10

# coding the replicate 
own_replicate <- replicate(nrep2, mean(rnorm(2)))
# setting the n to 2, keeping mean = 0 and sd = 1 default 

hist_own_2 <- function(nrep2) {
  hist(own_replicate)
}

# simulating histogram 
hist_own_2()

# many differences 

# comparing histograms 
par(mfrow = c(1,2), mar = c(5,5,1,1)) # code to see histograms together 
# patchwork would also work..? 
# n 1 
hist_normal_2()
# n 2 
hist_own_2()



# SIMULATING AN EFFECT - CHECKING POWER (t-tests) -----
# simulating no effect, alpha 

# drawing from the same normal distribution twice 

# first
one <- rnorm(3)

#second 
two <- rnorm(3)

# do two results differ significantly?

# student's t-test to see
t.test(one, two) # p-value shows no significant difference 

# extracting p-value
str(t.test(one, two)) # displays structure of the object 
# can use it to see exact code of p.value and vaue 

# extracting p-value
t.test(one, two)$p.value # will just display p.value 
# 0.9107287

# writing this whole thing as a function 
simulation <- function(n) {
  one <- rnorm(3)
  two <- rnorm(3)
  t.test(one, two)$p.value
}

# testing simulation 
simulation(50) # this will show no significance 
# 50 used as vector number 

# doing again but for where simulation(10)

# setting code for two plots 
par(mfrow = c(1,2))

# setting the replicates 
nrep <- 20
# replicate code for simulation 
# histogram 
sim2 <- replicate(nrep, simulation(10))
hist(sim2, breaks = 21, col = c("green", rep("red", 20)),
main = "nrep = 20, n = 10", xlab = "pvalue")

# setting the replicates 
nrep <- 100
# replicate code for simulations
sim2 <- replicate(nrep, simulation(10))
# histogram 
hist(sim2, breaks = 21, col = c("green", rep("red", 20)),
     main = "nrep = 100, n = 10", xlab = "pvalue")


# mixing amount of replicates and n values
# replicate = 1000

# setting the viewer to show two plots 
par(mfrow = c(1,2))

# histo 1 
nrep <- 1000
# replicate code for simulations 
sim3 <- replicate(nrep, simulation(100))
# histogram code 
hist(sim3, breaks = 21, col = c("green", rep("red", 20)),
main = "nrep = 1000, n = 100", xlab = "pvalue")

# histo 2 
# replicate code for simulations 
sim4 <- replicate(nrep, simulation(1))
# histogram code 
hist(sim4, breaks = 21, col = c("green", rep("red", 20)),
     main = "nrep = 1000, n = 1", xlab = "pvalue")

# not much difference between n = 100 and n = 1
# however shows a range 0f 0-0.8 for both and that they are never significant 

# simulating FOR effect / CHECK POWER 

# calculate the power of a t-test for a given sample 
power.t.test(n = NULL, delta = 0.5, sd = 1, sig.level = 0.05, power = 0.6)
# gives n? 

normdis1 <- rnorm(n = 10, mean = 1, sd = 0)
normdis2 <-rnorm(n = 100, mean = 2, sd = 1)

# t. test and extracting p value 

t.test(normdis1, normdis2)

str(t.test(normdis1, normdis2))

t.test(normdis1, normdis2)$p.value
# 4.415004e-18
# strong significant difference 

simulation2 <- function(n) {
  normdis1 <- rnorm(n = 10, mean = 1, sd = 0)
  normdis2 <-rnorm(n = 100, mean = 2, sd = 1)
  t.test(normdis1, normdis2)$p.value
}



power.t.test(n = NULL, delta = 0.5, sd = 1, sig.level = 0.05, power = 0.6)

# SIMULATING FOR A PRE-REGISTRATION -------

