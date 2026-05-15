install.packages("readxl")
install.packages("writexl")

#Load packages
library(readxl)
library(writexl)


#Dataset

set.seed(123)

sales_data <- data.frame(
  OrderID = 1:100,
  
  CustomerName =
    sample(c("Rahul","Amit","Priya","Neha",
             "Arjun","Sneha","Rohit","Kiran"),
           100, replace=TRUE),
  
  City =
    sample(c("Pune","Mumbai","Delhi",
             "Bangalore","Hyderabad"),
           100, replace=TRUE),
  
  Product =
    sample(c("Laptop","Mobile",
             "Tablet","Shoes","Watch"),
           100, replace=TRUE),
  
  Category =
    sample(c("Electronics","Fashion"),
           100, replace=TRUE),
  
  Quantity =
    sample(1:10,100,replace=TRUE),
  
  Price =
    sample(seq(500,50000,500),
           100,replace=TRUE),
  
  Discount =
    sample(c(0,5,10,15,20),
           100,replace=TRUE),
  
  PaymentMethod =
    sample(c("Cash","Card","UPI"),
           100,replace=TRUE)
)

sales_data$Revenue <-
  sales_data$Quantity * sales_data$Price

sales_data$DiscountAmount <-
  sales_data$Revenue *
  sales_data$Discount/100

sales_data$FinalAmount <-
  sales_data$Revenue -
  sales_data$DiscountAmount


#CREATING CSV FILE

write.csv(
  sales_data,
  "sales_data.csv",
  row.names = FALSE
)


write_xlsx(
  sales_data,
  "sales_data.xlsx"
)

getwd()

#Q1) Importing and Exploring Data
Question

#a) Import dataset from CSV file and Excel file.
#b) Display first 10 rows.
#c) Display last 10 rows.
#d) Check structure of dataset.
#e) Display summary statistics#


library(readxl)

# Import CSV file
sales_csv <- read.csv("sales_data.csv")

# Import Excel file
sales_excel <- read_excel("sales_data.xlsx")

# First 10 rows
head(sales_csv, 10)

# Last 10 rows
tail(sales_csv, 10)

# Structure of dataset
str(sales_csv)

# Summary statistics
summary(sales_csv)

#Q2) Exporting Data
#Question

#a) Export dataset to CSV file.
#b) Export dataset to Excel file.
#c) Export only Electronics category.
#d) Export customers from Pune.
#e) Export top 20 rows

library(writexl)

# Export full dataset to CSV
write.csv(
  sales_data,
  "output_sales.csv",
  row.names = FALSE
)

# Export full dataset to Excel
write_xlsx(
  sales_data,
  "output_sales.xlsx"
)

# Export Electronics category
electronics_data <-
  subset(sales_data,
         Category == "Electronics")

write.csv(
  electronics_data,
  "electronics.csv",
  row.names = FALSE
)

# Export Pune customers
pune_customers <-
  subset(sales_data,
         City == "Pune")

write.csv(
  pune_customers,
  "pune_customers.csv",
  row.names = FALSE
)

# Export top 20 rows
top20 <- head(sales_data,20)

write.csv(
  top20,
  "top20.csv",
  row.names = FALSE
)

#Q3) Modifying Data and Subset Creation
#Question
#1Create Profit column.
#2Rename FinalAmount column.
#3Remove DiscountAmount column.
#4Add Tax column.
#5Select orders with Quantity > 5.

# Create Profit column
sales_data$Profit <-
  sales_data$FinalAmount * 0.20

# Rename FinalAmount column
names(sales_data)[
  names(sales_data) == "FinalAmount"
] <- "TotalAmount"

# Remove DiscountAmount column
sales_data$DiscountAmount <- NULL

# Add Tax column
sales_data$Tax <-
  sales_data$TotalAmount * 0.18

# Orders with Quantity > 5
high_quantity <-
  subset(sales_data,
         Quantity > 5)

print(high_quantity)


#Q4) Column Selection
#Question
#1Select CustomerName and Product columns.
#2Select first 5 columns.
#3Select numeric columns.
#4Remove Discount column.
#5Select specific columns using index.

# Select CustomerName and Product
sales_data[, c("CustomerName","Product")]

# Select first 5 columns
sales_data[,1:5]

# Select numeric columns
numeric_columns <-
  sales_data[
    ,
    sapply(sales_data,is.numeric)
  ]

print(numeric_columns)

# Remove Discount column
sales_no_discount <-
  sales_data[
    ,
    !(names(sales_data) %in% "Discount")
  ]

# Select specific columns using index
sales_data[, c(2,4,6)]

#Q5) Sorting Data
#Question
#1Sort by City alphabetically.
#1Sort by City and Revenue.
#3Average price by city.
#4Maximum order value by city.
#5Total quantity sold by city.

# Sort by City alphabetically
sorted_city <-
  sales_data[
    order(sales_data$City),
  ]

print(sorted_city)

# Sort by City and Revenue
sorted_city_revenue <-
  sales_data[
    order(
      sales_data$City,
      -sales_data$Revenue
    ),
  ]

print(sorted_city_revenue)

# Average price by city
aggregate(
  Price ~ City,
  sales_data,
  mean
)

# Maximum order value by city
aggregate(
  Revenue ~ City,
  sales_data,
  max
)

# Total quantity sold by city
aggregate(
  Quantity ~ City,
  sales_data,
  sum
)


