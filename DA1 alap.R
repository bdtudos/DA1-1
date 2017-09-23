1 + 3
2*3
pi
'pi'
"pi"
str (pi)
str ("pi")
letters
str (letters)
LETTERS
letters [1]
letters [99]
letters [c(1,10)]
c(1,10)
str(c(1,10))
## style matters: comments on its own
1 + 2 #style: comment at the end of line


##variables
x <- 2
x
x = 2
## most R programmesr use <- instead of = at variable assignment
str (x)
str (2L)
str (345L)
str (as.integer(345))
x * 2
sqrt (x)
x ^ 1/2
x ^ (1/2)
#random numbers
runif (1)
runif (1)
## random number with same random number
set.seed (42)
runif (1)
runif (1)
set.seed (42)
runif (1)
runif (2)
runif (5)
round (runif(5))
z = runif (5)
z
round (z)
round (z,2)
round (digits = 2, x = z)
## todo: generate 1,000 random numbers between 0,-10, round to digits = 2 and visualize all these numbers
nums = round (runif (1000)*10,2)
nums 
plot (nums)
hist(nums)
## kicsit szebben
hist (round (runif (1000, min = 0, max = 10),2))

boxplot (nums)

## FUNCTIONS
f <- function (x) 2 * x + 1
f (5)
f (1:5)
1 : 5
#multiline
f <- function (x) {
  2 * x + 1 
}
f (1 : 5)
## functions in R accept vectors
## Do no loop in R, that is very slow


x <- 1 : 5
plot (x, f(x))
plot (x, f(x), type = 'l')   #linear instead of plots


1 : 5
seq (1, 5, by = 0.1)


## TODO: 1 period of sign curve to be plotted
x = seq (0, 2 * pi, by = 0.1)
plot (x, sin (x), type = 'l')


##random walk example
x = round (runif (25)) * 2 - 1
cumsum (x)
x <- round (runif (25)) * 2 - 1 
cumsum (x)
x


## data frame
h <- c (174,170,160)
w = c (90,80,70)
plot (h, w, xlab = 'Height', ylab = "Weight")
cor (h,w)
lm (w ~ h)  #building a linear model with formula notation (h is the independent variable, w is the model)
fit <- lm (w ~ h)
summary (fit)
abline (fit)
## summary and abline are for linear functions
abline (fit, col='red')
