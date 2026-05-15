#ASSIGNMENT NO.8: Working with CSV and Excel Files in R  
#mporting Data from CSV 
#Questions: 
#Use data.xlsx to solve following questions 

data <- read_excel("C:\\Users\\Public\\OneDrive\\Documents\\r studio & p\\assignments\\data.xlsx", sheet = "sales_data") 
head(sales,10)
#Q1) A Retail Sales Analysis (Dataset: sales.csv) 
#a) Load the sales dataset and display the first 10 records. 
#b) Calculate total revenue for each product. 
#c) Find the top 5 products with highest revenue. 
#d) Filter sales where quantity sold is greater than 50. 
#e) Find average product price by category. 
#Retail Sales Analysis 

Dataset: sales.xlsx (Sheet: sales) 
library(readxl) 
library(dplyr) 
# Load Dataset 
data <- read_excel("C:\\Users\\Public\\OneDrive\\Documents\\r studio & p\\assignments\\data.xlsx") 
#a) Load the sales dataset and display the first 10 records. 
# Display first 10 records 
head(data, 10) 

#b) Calculate total revenue for each product. 
# Create Revenue Column 
data$Revenue <- data$Quantity * data$Price 

# Total Revenue by Product 
total_revenue <- data %>% 
  group_by(Product) %>% 
  summarise(Total_Revenue = sum(Revenue)) 
total_revenue 

#Q2) The E-Commerce Customer Analysis (Dataset: customers.csv) 
#a) Load the customers dataset and display the first 10 records. 
#b) Calculate average purchase amount. 
#c) Find customers above average purchase amount. 
#d) Count number of male and female customers. 
#e) Create age groups: Youth (<25), Adult (25–50), Senior (>50) 
#f) Find top 10 highest spending customers. 

Dataset: customers.xlsx 
library(readxl) 
library(dplyr) 
# Load Dataset 
data <- read_excel("C:\\Users\\Public\\OneDrive\\Documents\\r studio & p\\assignments\\data.xlsx", 
                   sheet = "customer") 
#a) Load the customers dataset and display the first 10 records. 
# Display first 10 records 
  head(data, 10) 
  
#b) Calculate average purchase amount. 
library(dplyr)
  names(data)
  
# Calculate average purchase amount correctly
avg_purchase <- mean(data$Amount, na.rm = TRUE)

# Filter customers above average
above_avg <- data %>%
  filter(Amount > avg_purchase)

# Check result
head(above_avg)

# Average Purchase Amount 
avg_purchase <- mean(data$Amount) 

avg_purchase 

#c) Find customers above average purchase amount. 
# Customers Above Average Purchase 
above_avg <- data %>% 
  filter(Amount > avg_purchase) 

above_avg 

#d) Count number of male and female customers. 
# Gender Count 
gender_count <- table(data$Gender) 

gender_count 

#e) Create age groups: Youth (<25), Adult (25–50), Senior (>50) 
# Create Age Groups 
data$AgeGroup <- ifelse(data$Age < 25, 
                        "Youth", 
                        ifelse(data$Age <= 50, 
                               "Adult", 
                               "Senior")) 

# Display Dataset 
head(data) 
 
#f) Find top 10 highest spending customers. 
# Top 10 Highest Spending Customers 
top_customers <- data %>% 
  arrange(desc(Amount)) %>% 
  head(10) 
top_customers 
 
Dataset: transactions.xlsx 
library(readxl) 
library(dplyr) 
# Load Dataset 
data <- read_excel("C:\\Users\\Public\\OneDrive\\Documents\\r studio & p\\assignments\\data.xlsx", 
                   sheet = "transactions") 
#a) Load the transactions dataset and display the first 10 records. 
# Display First 10 Records 
head(data, 10) 
 
#b) Calculate total deposits. 
# Total Deposits 
total_deposits <- data %>% 
  filter(TransactionType == "Deposit") %>% 
  summarise(Total_Deposit = sum(Amount)) 
total_deposits 
 
#c) Calculate total withdrawals. 
# Total Withdrawals 
total_withdrawals <- data %>% 
  filter(TransactionType == "Withdrawal") %>% 
  summarise(Total_Withdrawal = sum(Amount)) 
total_withdrawals 
 
#d) Find accounts with transactions above 10000. 
# Transactions Above 10000 
high_transactions <- data %>% 
  filter(Amount > 10000) 
high_transactions 
 
#e) Calculate average transaction amount. 
# Average Transaction Amount 
avg_transaction <- mean(data$Amount) 

avg_transaction 

#f) Count number of transactions by type. 
# Transaction Count by Type 
transaction_count <- table(data$TransactionType) 

transaction_count 

#Q4) The Healthcare Patient Dataset (patients.csv) 
#a) Load the patient’s dataset and display the first 10 records. 
#b) Find patients with high blood pressure (>140). 
#c) Detect patients with fever (>37°C). 
#d) Calculate average patient age. 
#e) Find maximum and minimum blood pressure. 
#f) Count number of patients above 60 years. 

Dataset: patients.xlsx 
library(readxl) 
library(dplyr) 

# Load Dataset 
data <- read_excel("C:\\Users\\Public\\OneDrive\\Documents\\r studio & p\\assignments\\data.xlsx", 
                   sheet = "patients") 


#a) Load the patient’s dataset and display the first 10 records. 
# Display First 10 Records 
head(data, 10) 
 
#b) Find patients with high blood pressure (>140). 
# High Blood Pressure Patients 
high_bp <- data %>% 
  filter(BloodPressure > 140) 
high_bp 
  
#c) Detect patients with fever (>37°C). 
# Patients with Fever 
fever_patients <- data %>% 
  filter(Temperature > 37) 
fever_patients 
 
#d) Calculate average patient age. 
# Average Age 
avg_age <- mean(data$Age) 
avg_age 
  
#e) Find maximum and minimum blood pressure. 
# Maximum Blood Pressure 
max_bp <- max(data$BloodPressure) 
# Minimum Blood Pressure 
min_bp <- min(data$BloodPressure) 
max_bp 
min_bp 

#f) Count number of patients above 60 years. 
# Patients Above 60 
senior_patients <- data %>% 
  filter(Age > 60) 
# Count Patients 
nrow(senior_patients) 
 
#Q5) The Student Performance Dataset (students.csv) 
#a) Load the students dataset and display the first 10 records. 
#b) Find students who scored above 80. 
#c) Calculate average marks by subject. 
#d) Find top scoring student. 
#e) Find students who failed (Marks < 40). 
#f) Count number of students in each subject. 

Dataset: students.xlsx 
library(readxl) 
library(dplyr) 

# Load Dataset 
data <- read_excel("C:\\Users\\Public\\OneDrive\\Documents\\r studio & p\\assignments\\data.xlsx", 
                   sheet = "students") 

#a) Load the students dataset and display the first 10 records. 
# Display First 10 Records 
head(data, 10) 

#b) Find students who scored above 80. 
# Students Scoring Above 80 
high_scorers <- data %>% 
  filter(Marks > 80) 

high_scorers 

#c) Calculate average marks by subject. 
# Average Marks by Subject 
avg_marks <- data %>% 
  group_by(Subject) %>% 
  summarise(Average_Marks = mean(Marks)) 
avg_marks 
  
#d) Find top scoring student. 
# Top Scoring Student 
top_student <- data %>% 
  arrange(desc(Marks)) %>% 
  head(1) 
top_student 

#e) Find students who failed (Marks < 40). 
# Failed Students 
failed_students <- data %>% 
  filter(Marks < 40) 
failed_students 

#f) Count number of students in each subject. 
# Student Count by Subject 
subject_count <- table(data$Subject) 

subject_count 

#Q6) The Social Media Analytics Dataset (posts.csv) 
#a) Load the posts dataset and display the first 10 records. 
#b) Calculate total engagement per post. 
#c) Find posts with engagement > 500. 
#d) Find most liked post. 
#e) Calculate average engagement. 
#f) Find posts with low engagement (<100). 

Dataset: posts.xlsx 
library(readxl) 
library(dplyr) 

# Load Dataset 
data <- read_excel("C:\\Users\\Public\\OneDrive\\Documents\\r studio & p\\assignments\\data.xlsx", 
                   sheet = "posts") 

#a) Load the posts dataset and display the first 10 records. 
# Display First 10 Records 
head(data, 10) 

#b) Calculate total engagement per post. 
# Total Engagement 
data$Total_Engagement <- data$Likes + 
  data$Comments + 
  data$Shares 
# Display Dataset 
head(data) 
 
#c) Find posts with engagement > 500. 
# Posts with High Engagement 
high_engagement <- data %>% 
  filter(Total_Engagement > 500) 
high_engagement 
  
#d) Find most liked post. 
# Most Liked Post 
most_liked <- data %>% 
  arrange(desc(Likes)) %>% 
  head(1) 
most_liked 

#e) Calculate average engagement. 
# Average Engagement 
avg_engagement <- mean(data$Total_Engagement) 
avg_engagement 
  
#f) Find posts with low engagement (<100). 
# Low Engagement Posts 
low_engagement <- data %>% 
  filter(Total_Engagement < 100) 
low_engagement 
