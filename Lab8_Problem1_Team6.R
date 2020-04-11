#Lab: 8
#Team: 6
#Team Members:
  #Melvin Zaldivar - Members contribution: 33.33%
  #Rahim Abdulmalik - Members contribution: 33.33%
  #Raul Beiza - Members contribution: 33.33%

## Finding Patterns - Market Basket Analysis Using 
## Association Rules

##=============================================
## Setp 1 - Exploring and preparing the data
##============================================

## Install and read necessary packages
install.packages("arules")
library(arules)

## Read grocery data set
groceries <- read.transactions("groceries.csv", sep = ",")
groceries 

## Check information for matrix
summary(groceries)

##============================================
## Step 2 - Training a model on the data
##===========================================

## Initial attempt using the apriori function
apriori(groceries)

## Changing our minimum confidence level and applying
## apriori function.
groceryrules <- apriori(groceries, parameter = list(support = 0.006, confidence = 0.25, minlen = 2))

##===========================================
## Step 3 - Evaluating model performance
##===========================================

## Summary statistics of the association rules
summary(groceryrules)

## Inspecting the first three rules
inspect(groceryrules[1:3])

##===========================================
## Step 4 - Improving model performance
##===========================================

## Sorting the set of association rules
inspect(sort(groceryrules, by = "lift")[1:5])

## Taking subsets of association rules
berryrules <- subset(groceryrules, items %in% "berries")

inspect(berryrules)

## Saving association rules to a file or data frame
write(groceryrules, file = "groceryrules.csv", sep = " , ", quote = TRUE,
      row.names = FALSE)

## Converting the rules into an R data frame
groceryrules_df <- as(groceryrules, "data.frame")

str(groceryrules_df)






