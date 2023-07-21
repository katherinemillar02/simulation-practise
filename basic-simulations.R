# practising some random selection 

# random number generator is 1 
set.seed(1)

# using the sample function 
sample(1:10, 4)
# this wll select 4 numbers from 1-10

# using this for letters 
sample(letters, 4)
# this will select 4 random letters

sample(1:10)
# simple code, will just select 10 numbers 1-10 in a random order 

sample(1:10, replace = TRUE)
# this means there will be repeats of numbers

# USING DATA SETS ---- 
library(datasets)

