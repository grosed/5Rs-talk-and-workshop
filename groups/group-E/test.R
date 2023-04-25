## some simple tests to make sure it runs....
rm(list=ls())
source("pel.R")

x <- seq(0,10,length=100)

a <- 10
q <- 3
v <- 1.1

dpel(x,a,q,v)


## reversability
px <- ppel(x,a,q,v)
xx <- qpel(px,a,q,v)

e <- (xx-x)
range(e) ## this isn't great exp in the upper tail - is it down to lamW function, seems more significant on tails??


rpel(100,a,q,v)
