#set working directory
setwd("/cloud/project")


#Load Dataset

#install.packages("readr")
library(readr)

TextMessages <- read_csv("TextMessages (1).csv")

#View 5 observations
head(TextMessages, n=5)

#View variable names
names(TextMessages)



#get Descriptive stats

#install.packages("dplyr")
library(dplyr)

#summarize messages by group for both time points
summary_stats <- TextMessages %>%
  group_by(Group) %>%
  summarise(
    Mean_Baseline = mean(Baseline, na.rm = TRUE),
    SD_Baseline = sd(Baseline, na.rm = TRUE),
    Median_Baseline = median(Baseline, na.rm = TRUE),
    Mean_SixMonths = mean(Six_months, na.rm = TRUE),
    SD_SixMonths = sd(Six_months, na.rm = TRUE),
    Median_SixMonths = median(Six_months, na.rm = TRUE),
    Count = n()
  )

#print summary stats
summary_stats



# Summary stats to Output File

write.csv(summary_stats, "SummaryStats_TextMessages.csv", row.names = FALSE)


# The summary table outputs summary stats for the text message data
#Standard deviation measures variability, with group 2 having a higher SD
