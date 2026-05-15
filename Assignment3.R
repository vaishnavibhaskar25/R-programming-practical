
set.seed(123) 
sales_data <- data.frame( 
  OrderID = 1:200, 
  CustomerName = 
    sample(c("Rahul","Amit","Priya","Neha","Arjun","Sneha","Rohit","Kiran"),200,replace=TRUE), 
  City = sample(c("Pune","Mumbai","Delhi","Bangalore","Hyderabad"),200,replace=TRUE), 
  Product = sample(c("Laptop","Mobile","Tablet","Shoes","Watch"),200,replace=TRUE), 
  Category = sample(c("Electronics","Fashion"),200,replace=TRUE), 
  Quantity = sample(1:10,200,replace=TRUE), 
  Price = sample(seq(500,50000,500),200,replace=TRUE), 
  Discount = sample(c(0,5,10,15,20),200,replace=TRUE), 
  PaymentMethod = sample(c("Cash","Card","UPI"),200,replace=TRUE) 
) 

sales_data$Revenue <- sales_data$Quantity * sales_data$Price 
sales_data$DiscountAmount <- sales_data$Revenue * sales_data$Discount/100 
sales_data$FinalAmount <- sales_data$Revenue - sales_data$DiscountAmount 


install.packages("dplyr")
library(dplyr)

#Q1) Problems on Recoding Variables, Sorting and New Variable Creation
#(a) Create OrderSize (Small, Medium, Large)
sales_data$OrderSize <- ifelse(
  sales_data$Quantity <= 3,
  "Small",
  
  ifelse(
    sales_data$Quantity <= 7,
    "Medium",
    "Large"
  )
)

head(sales_data)

#(b) Sort by Quantity Descending
sales_data_sorted <- sales_data[order(-sales_data$Quantity), ]

head(sales_data_sorted)

#(c) Sort by City and Revenue
sales_data_city <- sales_data[
  order(sales_data$City, sales_data$Revenue),
]

head(sales_data_city)

#(d) Create Tax Column
sales_data$Tax <- sales_data$FinalAmount * 0.18

head(sales_data)

#(e) Create TotalBill Column
sales_data$TotalBill <- sales_data$FinalAmount +
  sales_data$Tax

head(sales_data)

#Q2) Problems on select() and filter()
#(a) Select CustomerName and Product
select(sales_data, CustomerName, Product)

#(b) Select Numeric Columns
select_if(sales_data,is.numeric)

#(c) Remove Discount Column
select(sales_data, -Discount)

#d) Filter Pune Customers
filter(sales_data, City == "Pune")

#(e) Filter Multiple Conditions
#Price > 20000 and Quantity > 5
filter(sales_data,
       Price > 20000 &
         Quantity > 5)

#Q3) Problems on mutate() and arrange()
#(b) Create Profit Variable
#Assume profit is 20% of FinalAmount.
sales_data <- mutate(
  sales_data,
  Profit = FinalAmount * 0.20
)

head(sales_data)

#(c) Create OrderCategory
sales_data <- mutate(
  sales_data,
  
  OrderCategory = ifelse(
    Quantity <= 3,
    "Low",
    
    ifelse(
      Quantity <= 7,
      "Medium",
      "High"
    )
  )
)

head(sales_data)

#(d) Create DiscountCategory
sales_data <- mutate(
  sales_data,
  
  DiscountCategory = ifelse(
    Discount == 0,
    "No Discount",
    
    ifelse(
      Discount <= 10,
      "Low Discount",
      "High Discount"
    )
  )
)

head(sales_data)

#(e) Create PaymentType Variable
sales_data <- mutate(
  sales_data,
  
  PaymentType = ifelse(
    PaymentMethod == "UPI",
    "Online",
    "Offline"
  )
)

head(sales_data)

#(f) Sort by Revenue Descending using arrange()
arrange(sales_data, desc(Revenue))

#Q4) Problems on group_by() and summarise()
#(a) Total Revenue by City
sales_data %>%
  group_by(City) %>%
  summarise(
    TotalRevenue = sum(Revenue)
  )

#(b) Average Price by Product
sales_data %>%
  group_by(Product) %>%
  summarise(
    AveragePrice = mean(Price)
  )

#(c) Total Quantity Sold by Product
sales_data %>%
  group_by(Product) %>%
  summarise(
    TotalQuantity = sum(Quantity)
  )

#(d) Maximum Revenue by City
sales_data %>%
  group_by(City) %>%
  summarise(
    MaximumRevenue = max(Revenue)
  )

#(e) Minimum Revenue by Product
sales_data %>%
  group_by(Product) %>%
  summarise(
    MinimumRevenue = min(Revenue)
  )

Q5) Problems on Customer Analysis
sales_data %>%
  group_by(CustomerName) %>%
  summarise(
    TotalOrders = n()
  )

#(2) Total Revenue per Customer
sales_data %>%
  summarise(
    AverageOrderValue = mean(FinalAmount)
  )

#(4) Top Customer
sales_data %>%
  group_by(CustomerName) %>%
  summarise(
    TotalRevenue = sum(Revenue)
  ) %>%
  arrange(desc(TotalRevenue)) %>%
  head(1)

#(5) Sort Customers by Revenue
sales_data %>%
  group_by(CustomerName) %>%
  summarise(
    TotalRevenue = sum(Revenue)
  ) %>%
  arrange(desc(TotalRevenue))

#
