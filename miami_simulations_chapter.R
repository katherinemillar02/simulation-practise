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

if_test(3)


print(if_test(-3))


if_test_2 <- function(x) {
  if ( x >= 0) {
    return("positive")
  }
}

if_test_2(0)

if_test_2(0.1)
