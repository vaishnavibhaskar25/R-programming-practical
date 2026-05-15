# Create data frame
df <- data.frame(
  name = c("Raj","Amit", "Neha", "Raj","Amit"),
  marks = c("80", "90", NA, "85", "90"),
  city = c("Pune","pune","Mumbai","PUNE","Mumbai")
)

# Original Data
print("Original Data:")
print(df)


# 1. Remove extra spaces from name column
df$name <- trimws(df$name)

# 2. Convert all names to lowercase
df$name <- tolower(df$name)

# 3. Convert marks column to numeric and handle missing values
df$marks <- as.numeric(df$marks)

# Replace missing values with average marks
df$marks[is.na(df$marks)] <- mean(df$marks, na.rm = TRUE)

# 4. Standardize city names (all lowercase)
df$city <- tolower(df$city)

# 5. Filter students with marks greater than 80
filtered_students <- df[df$marks > 80, ]

# 6. Create grade column
df$grade <- ifelse(df$marks >= 85, "A", "B")


# Final Cleaned Data
print("Cleaned Data:")
print(df)

# Filtered Students
print("Students with marks greater than 80:")
print(filtered_students)

#Q2

# Create data
set.seed(100)
sales <- data.frame(
  Product = sample(c("Laptop","Mobile","Tablet"),50,replace=TRUE),
  City = sample(c("Pune","Mumbai","Delhi"),50,replace=TRUE),
  Quantity = sample(1:5,50,replace=TRUE),
  Price = sample(seq(10000,50000,5000),50,replace=TRUE)
)

# Create Revenue column
sales$Revenue <- sales$Quantity * sales$Price


# 1. Records where Revenue > 100000
sales[sales$Revenue > 100000, ]


# 2. Sort Revenue in descending order
sales[order(-sales$Revenue), ]


# 3. Total Revenue by City
aggregate(Revenue ~ City, sales, sum)


# 4. Average Price by Product
aggregate(Price ~ Product, sales, mean)


# 5. Product with highest total revenue
rev_product <- aggregate(Revenue ~ Product, sales, sum)

rev_product[which.max(rev_product$Revenue), ]

