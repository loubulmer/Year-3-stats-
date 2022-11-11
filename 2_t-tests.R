##LB
##R stuff for RSDA class
##t-tests using ozone data
##Is there a difference between gardens in the west and east

#reset R's brain 
rm(list=ls())

library(dplyr)
library(ggplot2)

#getwd tells me where R is looking
getwd()

#setwd tells R where to look 
setwd("C:\\Users\\lbulmer\\Documents\\R stuff\\Datasets\\datasets-master")

#bring in data and rename with <-
ozone.dat<-read.csv("ozone.csv")

#take a look at our data
glimpse(ozone.dat)

#let's plot our data
#we want to look at east and west gardens
#we can use histograms and our facet function 
ggplot(ozone.dat, aes(x = Ozone))+
  geom_histogram(binwidth = 10)+
  facet_wrap(~ Garden.location, ncol = 1)+
  theme_bw()

##fairly normal and equality of variance
##let's use dplyr to look at mean and sd
summarise(
  group_by(ozone.dat, Garden.location), 
  meanOzone = mean(Ozone), 
  sdOzone = sd(Ozone))

#let's do a t-test
t.test(Ozone ~ Garden.location, data = ozone.dat)



          
