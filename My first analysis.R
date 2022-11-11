##LB 
##R stuff for RSDA class
#############

#reset R's brain 
rm(list=ls())

##only need to do this once then #out
#install.packages("dplyr",dependencies = TRUE)
#install.packages("ggplot2",dependencies = TRUE)

##run this every time for any packages you need
library(dplyr)
library(ggplot2)

#getwd tells me where R is looking
getwd()

#setwd tells R where to look 
setwd("C:\\Users\\lbulmer\\Documents\\R stuff\\Datasets\\datasets-master")

#bring in data and rename with <-
compensation<-read.csv("compensation.csv")

#look at first 6 rows
head(compensation)

##look at heading names
names(compensation)

#look at dimensions - number of rows and columns
dim(compensation)

#look at structure of the dataset
str(compensation)

##dplyr functions showing column names and type of data
#horizontal view of data
glimpse(compensation)
#vertical view of data
as_tibble(compensation)

#summary stats of data
summary(compensation)

################################################
#part2

#making a plot - scatterplot 
ggplot(compensation, aes(x = Root, y = Fruit))+
  geom_point()

#getting rid of the grey using theme - keep this at the end
ggplot(compensation, aes(x = Root, y = Fruit))+
  geom_point() +
  theme_bw()

#changing the size of the dots
ggplot(compensation, aes(x = Root, y = Fruit))+
  geom_point(size = 5) +
  theme_bw()

#adding x and y labels
ggplot(compensation, aes(x = Root, y = Fruit))+
  geom_point(size = 5) +
  xlab("Root Biomass") +
  ylab("Fruit Production")
  theme_bw()

#now let's add colour
  ggplot(compensation, aes(x = Root, y = Fruit, colour = Grazing))+
    geom_point(size = 5) +
    xlab("Root Biomass") +
    ylab("Fruit Production") +
  theme_bw()
  
#making a box and whisker plot - use geom_boxplot
  #we are now interested in grazing treatment
  #alpha is transparency of points
  ggplot(compensation, aes(x = Grazing, y = Fruit))+
    geom_boxplot() +
    geom_point(size = 5,colour = 'light grey', alpha = 0.5)+
    xlab("Grazing Treatment") +
    ylab("Fruit Production")+
  theme_bw()

#now make a histogram,
  #bins is number of bins/columns
  ggplot(compensation, aes(x = Fruit))+
    geom_histogram(bins = 10)
 #or the width of the bins/columns
  ggplot(compensation, aes(x = Fruit))+
    geom_histogram(binwidth = 15)

#to could compare two graphs 
#to look at grazed or ungrazed    
#we use facet for this and ~ symbol to group
  ggplot(compensation, aes(x = Fruit))+
    geom_histogram(binwidth = 15)+
    facet_wrap(~Grazing, ncol = 1)
  
  
