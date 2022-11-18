##LB
##R stuff for RSDA class
##ANOVA tests
##Is there a difference in plant growth 
##four different treatment groups

#reset R's brain 
rm(list=ls())

##we need to install a new package
install.packages("ggfortify")
#load packages to library
library(dplyr)
library(ggplot2)
library(ggfortify)

#getwd tells me where R is looking
getwd()

#setwd tells R where to look 
setwd("C:\\Users\\lbulmer\\Documents\\R stuff\\Datasets\\datasets-master")

#bring in data and rename with <-
mydat<-read.csv("Daphniagrowth.csv")

#take a look
glimpse(mydat)
str(mydat)

#Checking data 
hist(mydat$growth.rate)
shapiro.test(mydat$growth.rate)
#right on the boundary

#lets take a look at the summary data
summarise(
  group_by(mydat, parasite), 
  meangrowth.rate = mean(growth.rate))

#Running a One-Way ANOVA
##four treatment groups 
#growth rate 
growth<-aov(growth.rate ~ parasite, data = mydat)
summary(growth)
##looks like there is a significant difference for parasite
#We can't tell which so need another test
TukeyHSD(growth)
##let's have a look
plot(TukeyHSD(growth, conf.level = .95), las = 2)

##check the residuals 
##this is from the new package we installed
autoplot(growth, smooth.colour = NA)

