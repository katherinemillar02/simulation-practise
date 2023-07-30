# trying to ensure learning of simulations 
# do any of these require additional packages? 

# coin as an example 
coin <- c("heads", "tails")

# selecting one of heads or tails
sample(coin, size = 1)

# groups as an example 
groups <- c("kick", "receive")

# selecting one of kick or receive 
sample(groups, size = 1)

# selecting eight of kick or receive 
sample(groups, size = 8, replace = TRUE)

# without replace = TRUE 
sample(groups, size = 8) # does not work - as only two elements to choose from 

# using 'if'
if_test <- function(x) { 
  if (x > 0 ) {
    return("positive")
  }
}

# this labels the function as if.test
# then says if x is more than 0 than return a positive

# checking with the number 3 is more than 0
# will return a positive as x is more than 0 
if_test(3)

# checking with -3
# does not return anything because not more than 0 
if_test(-3)

# using print function just to show it can return something 
print(if_test(-3))
# returns null 

# trying the if function again this time with more or equal to 0 
if_test_2 <- function(x) {
  if ( x >= 0) {
    return("positive")
  }
}

# testing 0
if_test_2(0)
# says is positive 

# testing -0.1
print(if_test_2(-0.1))
# negative as is less than 0 

if_test_3 <- function(x) {
  if (x > 0) {
    return("positive")
  }
  if (x < 0) {
    return("negative")
  }
}

# testing the function for positive
if_test_3(2)

# testing the function for negative
if_test_3(-2)

# getting a print value - as 0 will not give a value
print(if_test_3(0))

# trying an IF ELSE function

if_test_4 <- function(x) {
  if ( x > 0) {
    return("positive")
  } else if (x < 0) { # otherwise instead of another function
    return("negative")
  }
}

# testing for positive 
if_test_4(3)

# testing for negative
if_test_4(-3)
