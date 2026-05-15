# Assignment No. 10
# Complete Data Analysis Using R Final Project

# Install Packages

install.packages("ggplot2")
install.packages("dplyr")

library(ggplot2)
library(dplyr)

# Import Dataset

titanic <- read.csv(
  "C:/Users/Acer/Downloads/archive/Titanic-Dataset.csv"
)

# Display First 10 Rows

head(titanic,10)

# Display Structure

str(titanic)

# Display Summary

summary(titanic)

# Check Missing Values

colSums(is.na(titanic))

# Remove Missing Values

titanic <- na.omit(titanic)

# Display Dataset After Cleaning

head(titanic)

# Total Passengers

nrow(titanic)

# Count Male and Female

table(titanic$Sex)

# Count Survival

table(titanic$Survived)

# Average Age

mean(titanic$Age)

# Maximum Fare

max(titanic$Fare)

# Minimum Fare

min(titanic$Fare)

# Correlation between Age and Fare

cor(titanic$Age,titanic$Fare)

# Survival by Gender

table(titanic$Sex,titanic$Survived)

# Histogram of Age

ggplot(titanic,
       aes(x=Age)) +
  
  geom_histogram(bins=20)

# Scatter Plot Age vs Fare

ggplot(titanic,
       aes(x=Age,y=Fare)) +
  
  geom_point()

# Bar Chart of Passenger Class

ggplot(titanic,
       aes(x=as.factor(Pclass))) +
  
  geom_bar()

# Boxplot of Fare by Class

ggplot(titanic,
       aes(x=as.factor(Pclass),y=Fare)) +
  
  geom_boxplot()

# Survival Count Graph

ggplot(titanic,
       aes(x=as.factor(Survived))) +
  
  geom_bar()

# Average Fare by Gender

aggregate(
  Fare ~ Sex,
  titanic,
  mean
)

# Average Age by Passenger Class

aggregate(
  Age ~ Pclass,
  titanic,
  mean
)

# Top 10 Highest Fare Passengers

top_fare <- titanic[
  order(-titanic$Fare),
]

head(top_fare,10)

# Create Age Group

titanic$AgeGroup <- ifelse(
  titanic$Age < 18,
  "Child",
  
  ifelse(
    titanic$Age < 60,
    "Adult",
    "Senior"
  )
  
)

# Count Age Groups

table(titanic$AgeGroup)

# Survival Rate by Gender

prop.table(
  table(
    titanic$Sex,
    titanic$Survived
  ),
  1
)
