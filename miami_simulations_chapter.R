# trying to ensure learning of ?tidyverse? simulations 

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
sample(groups, size = 8) # does not work 


