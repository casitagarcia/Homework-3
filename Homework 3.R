#Create stratified bar charts of text messages by Time
setwd("Cloud/Project")
TM <- read.csv("TextMessages.csv", header=TRUE)
is.factor (TM$Group)
TM$Group <- as.factor(TM$Group)
is.factor (TM$Group)
#install.packages("ggplot2")
library(ggplot2)
boxplot_TMbyTime <- ggplot(TM, aes(Group, Six_months))
boxplot_TMbyTime
boxplot_TMbyTime + geom_boxplot() + labs(x="Group", y="Text Messages by Time") 

