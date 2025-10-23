setwd("/cloud/project")

#NOTE: In order to wrap text, Remember to highlight each comment and press CTRL
#+ Shift + /

#installing the package needed to read an .xlsx file 
#install.packages("readxl")

#Loading the packages
library(readxl)

#importing the data needed
TextMessages <-read_excel("TextMessages.xlsx")

#to view and print on console window the first 5 observations
head(TextMessages)

#to output the total number of rows of data
nrow(TextMessages)
#output on the console window displays 50, confirming that our data has 50 rows

#to view and print the variable names on the console window
names(TextMessages)
#we confirm the 4 variable names from the data description:Group, Baseline, Six_months, and Participant

# PREPARING THE VARIABLES #

#Check if "Group" is a factor
is.factor(TextMessages$Group)

#It is not a factor so we convert it into one
TextMessages$Group <- as.factor(TextMessages$Group)

#Confirm the conversation
is.factor(TextMessages$Group)

#Install ggplot function
#install.packages("ggplot2")

#load the packages
library(ggplot2)


################
#ERROR BAR PLOT#
################

#Create a ggplot object using Group as x-axis and six_months as y-axis 
barWithErrors_SixMonthsByGroup <- ggplot(TextMessages, aes(Group,Six_months))

#View the basic x-y axes setup
barWithErrors_SixMonthsByGroup

#Add the first layer showing bars representing the mean of each group
barWithErrors_SixMonthsByGroup + 
  stat_summary(fun = mean, geom = "bar", fill = "White", colour = "Black")

#Install and load Hmisc (For the creation of error bars)
#install.packages("Hmisc")
library(Hmisc)

#To add error bars showing 95% confidence intervals for group means
barWithErrors_SixMonthsByGroup +
  stat_summary(fun = mean, geom = "bar", fill = "White", colour = "Black") +
  stat_summary(fun.data = mean_cl_normal, geom = "pointrange", colour = "Red")

#Adding descriptive axis labels
barWithErrors_SixMonthsByGroup +
  stat_summary(fun = mean, geom = "bar", fill = "White", colour = "Black") +
  stat_summary(fun.data = mean_cl_normal, geom = "pointrange", colour = "Red") +
  labs(x = "Group", y = "Average Texts at Six Months")

#Check the mean values per group to help decice y-axis scale 
by(TextMessages$Six_months, TextMessages$Group, mean)

# Set custom y-axis limits and tick marks for better readability
barWithErrors_SixMonthsByGroup +
  stat_summary(fun = mean, geom = "bar", fill = "White", colour = "Black") +
  stat_summary(fun.data = mean_cl_normal, geom = "pointrange", colour = "Red") +
  labs(x = "Group", y = "Average Score at Six Months") +
  scale_y_continuous(limits = c(0, 100), breaks = seq(from = 0, to = 100, by = 5))

#This bar plot by shows the mean Six_months score by Grouo with red error bars 
#Representing 95% confidence intervals. Non-overlapping error bars suggest the 
#significant differences between groups. 
