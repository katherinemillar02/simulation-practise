# beginning with rnorm function 

rnorm(5) # 5 numbers with a mean of 0, sd of 1

# FINDING THE PROBAILITY INSTEAD OF RANDOM
pnorm(5, 4, 2) # less than 5, mean 4, sd 2 
# 5 is q = want to evaluate this 

# quantile function
qnorm(0.975) # p = 0.975, mean = 0, sd = 1 (as is default)
# inverse of pnorm

# SAMPLING FROM COMPLEX DISTRIBUTIONS
# Accept reject algorithim 

# generating 
triangle <- 
  function(x) {
    ifelse(( 0 < x ) + (x < 1), x, # if x is between 0 and 1, return to x 
    ifelse ((1 <= x) + (x < 2), 2 - x, 0)) # if x is between 1 and 2, return to 2 - x 
  } # if x is less than or equal to 2, return to 0 

# testing the code 
print(triangle(6))


triangle_plot <- data.frame(x = seq(-0.5, 2.5, by = 0.01),
                               y = triangle(seq(-0.5, 2.5, by = 0.01)),
                               x_sample = runif(301, 0, 2),
                               y_sample = runif(301, 0, 1))

