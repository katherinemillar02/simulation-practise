
# STANDARD PROBABILITY DISTRIBUTIONS ----

rnorm(5) # 5 numbers with a mean of 0, sd of 1

# FINDING THE PROBAILITY INSTEAD OF RANDOM
pnorm(5, 4, 2) # less than 5, mean 4, sd 2 
# 5 is q = want to evaluate this 

# quantile function
qnorm(0.975) # p = 0.975, mean = 0, sd = 1 (as is default)
# inverse of pnorm

# SAMPLING FROM COMPLEX DISTRIBUTIONS ----
# Accept reject algorithim 

# pdf = probability density function 

# generating 
triangle <- 
  function(x) {
    ifelse(( 0 < x ) + (x < 1), x, # if x is between 0 and 1, return to x 
    ifelse ((1 <= x) + (x < 2), 2 - x, 0)) # if x is between 1 and 2, return to 2 - x 
  } # if x is less than or equal to 2, return to 0 

# testing the code 
print(triangle(6))


triangle_frame <- 
  data.frame(x = seq(-0.5, 2.5, by = 0.01),
             # generates sequences from -0.5 to 2.5, step size is 0.01
                               y = triangle(seq(-0.5, 2.5, by = 0.01)),
             # Y ( generates sequences from -0.5 to 2.5, step size is 0.01)
             # this is from the triangle data!! 
                               x_sample = runif(301, 0, 2),
# X (generates uniform distribution, 301 values, min = 0, max = 2 )
                               y_sample = runif(301, 0, 1))
# Y (generates uniform distribution, 301 values, min 0, max = 1)


# loading ggplot package to visualise this simulation 
library(ggplot2)

# to plot? 
triangle_plot <- 
ggplot(triangle_frame, aes(x = x, y = y)) +
# first line of ggplot code: give generated data, then x and y within the generated data
# x = seq(-0.5, 2.5, by = 0.01)
# y = y = triangle(seq(-0.5, 2.5, by = 0.01))
# difference between x ans y? 
  geom_line() + xlab ("x") + ylab ("y") +
  geom_segment(aes(x = 0,  y = 0, xend = 0, yend = 1), linetype = "dashed") +
  geom_segment(aes(x = 0, y = 1, xend = 2, yend = 1), linetype = "dashed") + 
  geom_segment(aes(x = 2, y = 1, xend = 2, yend = 0), linetype = "dashed") + 
  geom_point(aes(x = x_sample, y = y_sample), shape = 1)

triangle_plot

# not so much a 'triangle' 

library(AR) # accept reject package in R 

# probaility density function
# accept - reject sampling 
accept_reject = function(fx, n = 100) { 
  # probaility density function, 100 times 
  x <- numeric(n) # value of x, no data yet here though
  count = 0 # count will have value of 0 - count: counter 
  
  
while(count < n) {  # count of 0 < n - while = loop syntax 
  temp <-  runif(1, 0, 2) 
  # labelling temp as a generated single value of a random uniform distribution with a min = 0 , max = 2
  y <- runif(1,0,2)
  # labelling y as a generated single value of a random uniform distribution with a min = 0 , max = 2
  if (y < fx(temp)) { # if function, is y less than function fx and temp (runif 1,0,2)
    count = count + 1 # the return for above functiuon - if y is less than ... then count + 1 instead 
    x[count] <- temp # temp value in x 
  } } 
  
  return(x)
}

# loading in tidyverse package 
library(tidyverse)


# RUNNING ACCEPT - REJECT EQUATION 
sample = accept_reject(triangle_frame, 10000)

# Visualising this with a histogram 
triangle_pdf <- ggplot(triangle_frame, aes(x = x, y = y)) +
  geom_line(color = "blue", size = 1.5) + xlab("x") + ylab("pdf") +
  geom_histogram(data = data.frame(x = sample), aes(x = x, y = ..density..), col = "gray" )


# not quite the data that needs to be generated
# but running the code they provide does the same 
# ~ ERRORS HERE ~ 



# METROPOLITAN HASTINGS ALGORITHIM 
# have named the function alpha, takes two input arguments (x and y)
# calculates a value based on the formula provided, and returns it 
alphalol <- function(x, y) { # alpha function takes arguments x and y
  exp(-y^4 + x^4) * (1 + abs(y)) ^ 3 * (1+ abs(x)) ^ {-3}# exponential calculation of [ - (y) ^ 4 ] + [ (x) ^ 4]
  }   # absolute value of y: positive or 0 
  # whole equation is calculated to the power of 3 
    # absolute value of x: positive or 0 
  # whole equation is calculated to the power of -3 


alpha(1,2) # running code 

# monte carlo function 
mc_function <- function(alphalol, burnin, N, thin) { # mc function: 4 arguments 
  x <- numeric(burnin + N * thin) # creates numeric vector x = of length: burnin + thin (initialised with 0s)
  x[1] <- rnorm(1)# [1] value of x, random number from  normal distribution rnorm(1) n = 1, mean =1, sd = 1
  for (i in 2:(burnin + N * thin)) { # the loop 
    # iterates from "2" to "burnin" + n * thin
    prop <- rnorm(1, x[i - 1], 1) # INSIDE THIS LOOP
    # PROP is drawn from a normal distribution ~ centered around x[i -1], 1 sd = 1
    alpha <- min(1, alphalol(x[i- 1], prop)) # acceptance probability?
    # previous function used to calculate alpha 
    x [i] <- ifelse(rbinom(1,1, alpha), prop, x [i-1])
  }    # x [i] will be updated 
  return(x[burnin+ (1:N) * thin])
} # returns a subset of the x vector from burnin + thin 


# trying out the mc function 
sample_mc <- mc_function(alphalol, 5000, 10000, 10) # calculating the acceptance probability 

# generating samples 
sample_mc


# 5000
#the number of burn-in iterations.
# the Markov chain established by the Metropolis-Hastings algorithm 
# is allowed to converge to the target distribution by discarding the initial samples.
# 10000
# the total number of iterations in the Markov chain 
# 10
# the thinnig factor 

# SIMULATIONS FROM STUDIES/ EXPERIMENTS (simulations from models) ----


#  making a new function based on x exponentials 
f_true <- function(x) { 
  # only x as an argument in the function 
  exp(- x ^ 4) * (1 + abs(x)) ^ 3 # calculating these exponentials and the absolute value 
}
# the input of x will determine the resulting value 

f_true(900) # just gives result of 0? 

# integral function
integral <- integrate(f_true, 0, Inf)
# using integrate() function with the f_true() function 
# used for numerical integration 
# lower vlauer is 0 and higher value is infinity 

# integral numerics 
c <- 2 * integral$value 
# calculates the value from integral x 2 
# naming variable c

f_true_2 <- function(x) { 
  # only x as an argument in the function 
  exp(- x ^ 4) * (1 + abs(x)) ^ 3 / c # calculating these exponentials and the absolute value 
}
# the input of x will determine the resulting value

# calulating the f function again but dividing by the new c 

# visualising this data 

# first creating a new data frame with the collected data 
f_true_2_df <- data.frame(x = seq(-2,2, length = 100),
                            y = f_true_2(seq(-2,2, length = 100)))


# visualising data 
# plot 
f_true_plot <- ggplot(f_true_2_df, aes(x, y)) +
geom_line(colour = "green", size = 1.4) + xlab("x") + ylab("pdf") +
  geom_histogram(data = data.frame(x = sample), aes(x = x, y = ..density..),
                 color = "red")+
  theme_classic()

