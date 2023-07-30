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


