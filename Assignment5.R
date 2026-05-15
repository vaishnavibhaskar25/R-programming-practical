
#ASSIGNMENT NO. 5



#Step 1: Install and Load Package
# Install ggplot2 package
install.packages("ggplot2")

# Load ggplot2 library
library(ggplot2)

# Read CSV file
sales_data <- read.csv("sales_data.csv")

# View first rows of dataset
head(sales_data)

#Q1) Basic ggplot Charts
#a) Scatter Plot for Price vs Revenue

# Scatter Plot

ggplot(sales_data, aes(x = Price, y = Revenue)) +
  geom_point(color = "blue") +
  ggtitle("Price vs Revenue")
#b) Bar Chart for City
# Bar Chart for City

ggplot(sales_data, aes(x = City)) +
  geom_bar(fill = "orange") +
  ggtitle("Orders by City")

#c) Histogram of Price
# Histogram of Price

ggplot(sales_data, aes(x = Price)) +
  geom_histogram(fill = "green", bins = 10) +
  ggtitle("Histogram of Price")

#d) Boxplot of Revenue by Category
# Boxplot of Revenue by Category

ggplot(sales_data, aes(x = Category, y = Revenue)) +
  geom_boxplot(fill = "pink") +
  ggtitle("Revenue by Category")

#e) Line Chart for Revenue by OrderID
# Line Chart

ggplot(sales_data, aes(x = OrderID, y = Revenue)) +
  geom_line(color = "red") +
  ggtitle("Revenue by OrderID")

#Q2) Customized Visualization

# Customized Bar Chart

ggplot(sales_data, aes(x = City)) +
  geom_bar(fill = "purple") +
  ggtitle("City Wise Orders") +
  xlab("City Name") +
  ylab("Number of Orders") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45))

#Q3) Multi-Variable Visualization
#a) Price vs Revenue colored by Category
ggplot(sales_data, aes(x = Price, y = Revenue, color = Category)) +
  geom_point() +
  ggtitle("Price vs Revenue by Category")

#b) Price vs Quantity colored by Category
ggplot(sales_data, aes(x = Price, y = Quantity, color = Category)) +
  geom_point() +
  ggtitle("Price vs Quantity")

#d) Top Cities by Revenue
ggplot(sales_data, aes(x = City, y = Revenue)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  ggtitle("Top Cities by Revenue")

#e) Top Products by Sales
ggplot(sales_data, aes(x = Product, y = Revenue)) +
  geom_bar(stat = "identity", fill = "gold") +
  ggtitle("Top Products by Sales")

#Q4) Bar Chart, Scatter Plot, Histogram Analysis
#a) Number of Orders per City
ggplot(sales_data, aes(x = City)) +
  geom_bar(fill = "cyan") +
  ggtitle("Orders per City")

#b) Price vs Revenue
ggplot(sales_data, aes(x = Price, y = Revenue)) +
  geom_point(color = "blue") +
  ggtitle("Price vs Revenue")

#c) Quantity vs Revenue
ggplot(sales_data, aes(x = Quantity, y = Revenue)) +
  geom_point(color = "red") +
  ggtitle("Quantity vs Revenue")

#d) Distribution of Quantity
ggplot(sales_data, aes(x = Quantity)) +
  geom_histogram(fill = "orange", bins = 10) +
  ggtitle("Distribution of Quantity")

#e) Histogram by Category
ggplot(sales_data, aes(x = Category)) +
  geom_bar(fill = "green") +
  ggtitle("Category Distribution")

#Q5) Box Plot, Line Chart, Faceted Chart Analysis
#a) Revenue by Category (Box Plot)
ggplot(sales_data, aes(x = Category, y = Revenue)) +
  geom_boxplot(fill = "lightblue") +
  ggtitle("Revenue by Category")

#b) Price by Product (Box Plot)
ggplot(sales_data, aes(x = Product, y = Price)) +
  geom_boxplot(fill = "yellow") +
  ggtitle("Price by Product")

#c) Revenue Trend by OrderID (Line Chart)
ggplot(sales_data, aes(x = OrderID, y = Revenue)) +
  geom_line(color = "blue") +
  ggtitle("Revenue Trend")

#d) Discount Trend (Line Chart)
ggplot(sales_data, aes(x = OrderID, y = Discount)) +
  geom_line(color = "red") +
  ggtitle("Discount Trend")

#e) City Orders by Category (Faceted Chart)
ggplot(sales_data, aes(x = City)) +
  geom_bar(fill = "purple") +
  facet_wrap(~Category) +
  ggtitle("City Orders by Category")


