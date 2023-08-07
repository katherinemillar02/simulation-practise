
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
f_true_plot_parker <- ggplot(f_true_2_df, aes(x, y)) +
geom_line(colour = "green", size = 1.4) + xlab("x") + ylab("pdf") +
  geom_histogram(data = data.frame(x = sample), aes(x = x, y = ..density..),
                 color = "red")+
  theme_classic()

# saving plot 
ggsave("figures/f_true_plot_parker.png", type="cairo", width=12, height=7, units="in", dpi=600)

# SIMULATION STUDIES // EXPERIMENTS 


# setting the seed for reproducible results
set.seed(5) 

# 
t.test.sim <- function(n = 30, N = 1000) { # SETTING A FUNCTION CALLED t-test simulation 
  
  # n = sample size 
  # N = simulation
  
  reject <- logical(N) # seeing if given sample leads to a rejection of the null hypothesis 
  
  # empty vector reject 
  # of length N (1000)
  # tracks whether the null hypothesis is rejected in each simulation 
  
  for (i in 1:N) { # setting a for loop 
    # iterates 1000 times 
    
    x <- rexp(n, rate = 1)
    
    # random sample - exponential of n
    # size 30, has rate parameter of 1 
    
    t.test.p.value <- t.test(x, mu = 1, alternative = "less")$p.value
    
    # one sample t test on the value x 
    # null hypothesis assumes a means of 1 (mu = 1)
    # the alternative hypothesis is set to "less" - this means it's a one sided test? 
    # the $p.value = will take the p value from the t test 
    
    reject[i] <- (t.test.p.value < 0.05)
    # says if p value is less than 0.05 then reject null hypothesis, will come out as TRUE or FALSE 
    
    
  }
  mean(reject)
  
  # will calculate how many times out of all the simulations that the null hypothesis was rejected 
  # gives an estimate of type 1 error rate (prob of falsley rejecting the null hypothesis)
}

# peforming the overall simulation
t.test.sim() # with the default n = 30

# changing the n value 

# trying n value of 50
t.test.sim(50)

# trying n value of 100 
t.test.sim(100) # even worse 

# going more up - trying an n value of 500
t.test.sim(500) 
# WORKS 

# need a sample of 500 in order for error rate to be 5% 


# t seems that when the data are from a population that is heavily right skewed, the one-sided (lower than alternative) t-test does not work as expected for smaller samples.



# more known models 
# simulating an epidemic from a SIR Model 
# conditions = Suspecitble (not yet), Infected (have), Removed (are immune)



# At different time steps: INFECTED can affect SUSPECTIBLE or themselves can become REMOVED 

SIRsim <- function(a, b, N, T) {
  # function for simulation of SIR epidemic 
  # a: infection rate
  # b: removal rate
  # N: initial susectibles - 1 initial infected 
  # T: simulation length   
  S <- rep(0, T+1)
  I <- rep(0, T+1)
  R <- rep(0, T+1)
  # 3 vectors in the code: S, I, R
  # with lengths: T+1 = stores number of sus, infectious, recovered 
  # matrix size = (T+1)*3 - columns S, I, R / respectively 
  # setting
  S[1] <- N  # S is N suspectible individuals 
  I[1]<- 1 # I is 1 infectious individual 
  R[1] <- 0 # R is 0 recovered individuals 
  # starting a simulation for loop 
  for (i in 1:T) { # a loop runs from 1 : T - epidemic progression at each time step 
    S[i+1] <- rbinom(1, S[i], (1-a)^I[i]) # random binomial distribution 
    # the number of suspectible individuals after potential exposure to infectious indiviudals 
    R[i+1] <-  R[i] + rbinom(1, I[i], b)
    # the number of recovered indiciduals  - binomial distribution
    I[i+1] <- N + 1- R[i+1] - S[i+R]
    # the difference between the the initial total population, recov, and newly sus individuals  
  }
  return(data.frame(S=S,I=I, R=R)) # results for all sus, infec, recov
} 


# setting seed fpr repeatability 
set.seed(500)

# running different SIR simulations 
# remembering the parameters: a, b, N, T)
# infection rates set the same
# removal rate is up by 0.1 each simulation
# initial suspectibles : 1000?
# simulation length 100? 
sim1 <- SIRsim(0.0005, 0.1, 1000, 100 )
sim2 <- SIRsim(0.0005, 0.2, 1000, 100 )
sim3 <- SIRsim(0.0005, 0.3, 1000, 100 )
sim4 <- SIRsim(0.0005, 0.4, 1000, 100 )

# combining the simulation results
simulationdata <- as.data.frame(rbind(sim1, sim2, sim3, sim4))
# setting the object as simulation data 
# making a data frame binding these 4 simulations

# selecting objects from this data of sim number 
simulationdata$simulationnumber <- rep(c(1,2,3,4), each = 101) # 1,2,3,4 101 times
# selecting objects from this data of time 
simulationdata$time <- rep(1:101, times = 4) # represents the time between 1 and 101 

# running this simulation again to include the new info
simulationdata 

library(gridExtra) # from dplyr 

library(ggpubr)

library(dplyr)

# making a tibble of the data 
simulationtibble <- tibble(simulationdata)
                      
# plotting the data 
S1 <- simulationdata %>% 
  filter(simulationnumber == 1) %>% 
  ggplot(aes(x = time, y = S)) +
  geom_line() + xlab("") + ylab("S(t)") +
  ylim(c(0,1000))+
  theme_classic()
# plotting the data 
I1 <- simulationdata %>% 
  filter(simulationnumber == 1) %>% 
  ggplot(aes(x = time, y = I)) +
  geom_line() + xlab("") + ylab("I(t)") +
  ylim(c(0,1000))+
  theme_classic()
# plotting the data 
R1 <- simulationdata %>% 
  filter(simulationnumber == 1) %>% 
  ggplot(aes(x = time, y = R)) +
  geom_line() + xlab("") + ylab("R(t)") +
  ylim(c(0,1000))+
  theme_classic()

SIR1 <- ggarrange(S1, I1, R1, ncol = 1) # similar to patchwork,  combines plots

# will annotate arranged figure - overrides name 
SIR1 <- annotate_figure(SIR1, top = "alpha = 0.0005 beta = 0.1")

# saving figure 
ggsave("figures/SIR1.png", type="cairo", width=12, height=7, units="in", dpi=600)

# making plots based on the second section of data 

# suspectible plot 2 
S2 <- simulationdata %>% 
  filter(simulationnumber == 2) %>% 
  ggplot(aes(x = time, y = S)) +
  geom_line() + xlab("") + ylab("S(t)") +
  ylim(c(0,1000))+
  theme_classic()

# infectious plot 2 
I2 <- simulationdata %>% 
  filter(simulationnumber == 2) %>% 
  ggplot(aes(x = time, y = S)) +
  geom_line() + xlab("") + ylab("I(t)") +
  ylim(c(0,1000))+
  theme_classic()

# recovered plot 2 
R2 <- simulationdata %>% 
  filter(simulationnumber == 2) %>% 
  ggplot(aes(x = time, y = R)) +
  geom_line() + xlab("") + ylab("I(t)") +
  ylim(c(0,1000))+
  theme_classic()

# combining these plots 
SIR2 <- ggarrange(S2, I2, R2, ncol = 1)

# adding a title to these plots 
SIR2 <- annotate_figure(SIR2, top = "alpha = 0.0005 beta = 0.2" )

# saving this plot
ggsave("figures/SIR2.png", type="cairo", width=12, height=7, units="in", dpi=600)

# column 3
S3 <- simulationdata %>% 
  filter(simulationnumber == 3) %>% 
  ggplot(aes(x = time, y = S)) +
  geom_line() + xlab("") + ylab("S(t)") +
  ylim(c(0,1000))+
  theme_classic()

I3 <- simulationdata %>% 
  filter(simulationnumber == 3) %>% 
  ggplot(aes(x = time, y = I)) +
  geom_line() + xlab("") + ylab("I(t)") +
  ylim(c(0,1000))+
  theme_classic()

R3 <- simulationdata %>% 
  filter(simulationnumber == 3) %>% 
  ggplot(aes(x = time, y = R)) +
  geom_line() + xlab("") + ylab("R(t)") +
  ylim(c(0,1000))+
  theme_classic()

SIR3 <- ggarrange(S3, I3, R3, ncol = 1)

SIR3 <- annotate_figure(SIR3, top = "alpha = 0.0005 beta = 0.3")

# saving figure 
ggsave("figures/SIR3.png", type="cairo", width=12, height=7, units="in", dpi=600)

# 4

# suspectible 
S4 <- simulationdata %>% 
  filter(simulationnumber == 4) %>% 
  ggplot(aes(x = time, y = S)) +
  geom_line() + xlab("") + ylab("S(t)") +
  ylim(c(0,1000))+
  theme_classic()

# infected 
I4 <- simulationdata %>% 
  filter(simulationnumber == 4) %>% 
  ggplot(aes(x = time, y = I)) +
  geom_line() + xlab("") + ylab("I(t)") +
  ylim(c(0,1000))+
  theme_classic()

# recovered 
R4 <- simulationdata %>% 
  filter(simulationnumber == 4) %>% 
  ggplot(aes(x = time, y = R)) +
  geom_line() + xlab("") + ylab("R(t)") +
  ylim(c(0,1000))+
  theme_classic()

# combining these plots 
SIR4 <- ggarrange(S4,I4,R4, ncol = 1)

# annotating combined plot 
SIR4 <- annotate_figure(SIR4, top = "alpha = 0.0005 beta = 0.4")

# saving combined plots 
ggsave("figures/SIR4.png", type="cairo", width=12, height=7, units="in", dpi=600)

# COMBINING ALL COMBINED PLOTS
# SIR and 1-4
combined_plots <- ggarrange(SIR1, SIR2, SIR3, SIR4, ncol = 2, nrow = 2)


# combining all these plots to see how 'behaviour' compares 
# what we know from the plot
# die out best is probs 0.4, infected stays low suspectible goes down, recovered increases 

SIRsim_4_df <- data.frame(S=0, I = 0, R = 0, time = 0, simulationnumber = 0)
for (i in 1:20) {
  simulationdata <- rbind(SIRsim_4_df, cbind())
}
