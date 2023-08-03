
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
accept_reject <- function(fx, n = 100) { 
  # probaility density function, 100 times 
  x <- numeric(n) # value of x, no data yet here though
  count <- 0 # count will have value of 0 - count: counter 
while(count < n) {  # count of 0 < n - while = loop syntax 
  temp <-  runif(1, 0, 2) 
  # labelling temp as a generated single value of a random uniform distribution with a min = 0 , max = 2
  y <- runif(1,0,2)
  # labelling y as a generated single value of a random uniform distribution with a min = 0 , max = 2
  if (y < fx(temp)) { # if function, is y less than function fx and temp (runif 1,0,2)
    count <- count + 1 # the return for above functiuon - if y is less than ... then count + 1 instead 
    x[count] <- temp # temp value in x 
  } } 
  
  return(x)
}

sample = accept_reject(triangle_frame, 1000)

# testing out simulated code 
# could not find function fx?? 
# may need to find n 


# SIMULATIONS FROM STUDIES/ EXPERIMENTS (simulations from models) ----