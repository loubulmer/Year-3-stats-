


######## 
rm(list=ls())

library(ggplot2)
library(ggfortify)

# getwd tells us where R is looking
getwd()

# setwd tells R where to look
setwd("C:\\Users\\lbulmer\\Documents\\R stuff\\Datasets\\datasets-master")
getwd()


## import the data
dat<- read.csv("toy_shark_data.csv")


# ignore this bit #############################################################
################################################################
# set.seed(67)
# 
# samps<- 200
# 
# perc_cov<- rnorm(samps, 55, 7)
# cor_col<- rep(c('Brown', 'Blue', 'Green'), length.out=samps)
# 
# mean_shark<- rnorm(samps, mean=perc_cov*(runif(1, 0.1, 0.3)), sd=rnorm(1, 0.7, 0.01))+ rpois(1,5)
# 
# count_shark<- rpois(samps, lambda = perc_cov*(runif(1, 0.01, 0.2))+ rpois(1,5))
# 
# 
# dat<- data.frame('perc_cov'=as.numeric(perc_cov), 'count_shark'=as.integer(count_shark), 'mean_shark'=as.numeric(mean_shark), 
#                  'cor_col'=as.factor(cor_col))

##############################################################################
############################################################################


head(dat)
str(dat)
summary(dat)




plot(mean_shark~ perc_cov, data=dat, xlim=c(30,75), ylim=c(7,18), pch=19, col='firebrick4',
     cex=2, xlab='Percentage cover', ylab='mean shark numbers')


?lm


mod<- lm(mean_shark~ perc_cov, data=dat)


anova(mod)
summary(mod)

#plot(mod)
autoplot(mod, smooth.colour = NA)


plot(mean_shark~ perc_cov, data=dat,  xlim=c(30,75), ylim=c(7,18), pch=19, col='darkorchid4',
     cex=2, xlab='Percentage cover', ylab='mean shark numbers')

abline(mod, lwd=3, col='cadetblue')




################################### correlation #########################
rm(list=ls())
### Waffle house divorce rate

N <- 50                          # number of US states
set.seed(909)                   # this means we all get same results
waffle_h <- rnorm(N,20,5)        # sim number of waffle houses

divorce_prop <- runif(N, 0.2, 0.5)      # divorce rates
divorce_rate <- divorce_prop*waffle_h +     # sim divorce rate as proportion + error
    rnorm( N , 0 , 0.5 )

# combine into data frame
d <- data.frame(waffle_h,divorce_rate)
head(d)


plot(waffle_h~ divorce_rate, data=d, col='cadetblue', pch=19, cex=2, xlab='Divorce rate',
     ylab='Number of waffle houses')

plot(divorce_rate~ waffle_h, data=d, col='cadetblue', pch=19, cex=2, xlab='Number of waffle houses',
     ylab='Divorce rate')


cor.test(x=d$divorce_rate, y=d$waffle_h, method= 'pearson')


