##LB
##R stuff for RSDA class
##ch-squared tests
##Ladybird data set
##Looking at colours and habitat
##H0 no association between colour and habitat

#reset R's brain 
rm(list=ls())

#load packages to library
library(dplyr)
library(ggplot2)

#getwd tells me where R is looking
getwd()

#setwd tells R where to look 
setwd("C:\\Users\\lbulmer\\Documents\\R stuff\\Datasets\\datasets-master")

#bring in data and rename with <-
lady<-read.csv("ladybirds_morph_colour.csv")

#take a look at our data
glimpse(lady)
str(lady)
head(lady)


#let's organise and plot our data
##let's group according to habitat and colour
totals<-lady
group_by(totals, Habitat, morph_colour)

##let's plot a graph 
ggplot(totals, aes(x = Habitat, y = number, 
                  fill = morph_colour)) +
  geom_bar(stat = "identity", position = "dodge")
##identity tells R not to calculate anything
##position = dodge puts the two habitats next to 
##each other, otherwise they might go one on top
##we are not checking for normality here

##R has just selected the colours
##let's change them
ggplot(totals, aes(x = Habitat, y = number, 
                   fill = morph_colour)) +
geom_bar(stat = "identity", position = "dodge") +
scale_fill_manual(values = c(black = "black", red ="red"))

##use any colour you want
ggplot(totals, aes(x = Habitat, y = number, 
                   fill = morph_colour)) +
geom_bar(stat = "identity", position = "dodge") +
scale_fill_manual(values = c(black = "purple", red ="orange"))


##let's do the chi-squared test
##first we transform the data set into a matrix
##at the moment it's all in columns
lady.mat<-xtabs(number ~ Habitat + morph_colour,
                data = lady)
##xtabs asked R to cross tabulate

##let's check it worked
lady.mat
##you can see we now have a matrix

##now the chi-squared test
chisq.test(lady.mat)

##we've got quite a high X2 value
##we've got a low p-value
##we can reject the H0
##to report (x2 = 19.1. df = 1, p<0.001)
##black ladybirds are significantly more frequent 
##in industrial habitats. 


