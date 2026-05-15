# Assignment No. 9
# Introduction to S3 and S4 Classes in R

install.packages("readxl")
library(readxl)

# Create Dataset

data <- data.frame(
  Name=c("Rahul","Priya","Amit","Sneha","Arjun"),
  Age=c(25,30,28,35,40),
  Income=c(50000,65000,55000,70000,80000),
  Membership=c("Gold","Silver","Gold","Platinum","Silver")
)

print(data)

# Q1 Customer Object Modeling using S3

customer <- list(
  Name="Rahul",
  Age=25,
  Income=50000,
  Membership="Gold"
)

class(customer) <- "Customer"

print.Customer <- function(x){
  
  cat("Customer Details\n")
  cat("Name :",x$Name,"\n")
  cat("Age :",x$Age,"\n")
  cat("Income :",x$Income,"\n")
  cat("Membership :",x$Membership,"\n")
  
}

print(customer)

customer$Income

customer$Income <- 60000

print(customer)

# Q2 Advanced Customer Class using S4

setClass(
  "CustomerS4",
  slots=list(
    Age="numeric",
    Income="numeric",
    Membership="character"
  )
)

cust1 <- new(
  "CustomerS4",
  Age=30,
  Income=70000,
  Membership="Gold"
)

setMethod(
  "show",
  "CustomerS4",
  
  function(object){
    
    cat("Age :",object@Age,"\n")
    cat("Income :",object@Income,"\n")
    cat("Membership :",object@Membership,"\n")
    
  }
)

cust1

cust1@Income

cust1@Income <- 80000

cust1

# Q3 Memory Management

x <- 1:1000

y <- x

y[1] <- 999

gc()

rm(x)

# Q4 Data Frame as Object

class(data)

str(data)

data$Income

data[1:3, ]

# Q5 List Based Object

obj <- list(
  a=1,
  b=2,
  c=3
)

class(obj) <- "MyClass"

obj$a

str(obj)

# Q6 Advanced Referencing

x <- data

y <- x

y$Age[1] <- 99

print(y)

# Q7 Class Inspection and Documentation

class(data)

str(data)

attributes(data)

summary(data)

# Q8 S4 Slot Manipulation

setClass(
  "Product",
  slots=list(
    Price="numeric"
  )
)

p <- new(
  "Product",
  Price=1000
)

p@Price

p@Price <- 2000

p

# Q9 Mixed Object Handling

lst <- list(
  Dataset=data,
  Values=1:10
)

str(lst)

lst$Values

lst$Values[1] <- 999

print(lst)

# Q10 Object Oriented Analysis

class(data)

summary(data)

average_income <- function(df){
  
  mean(df$Income)
  
}

average_income(data)

# Observation

# S3 and S4 classes were successfully
# implemented in R.

# Result

# Thus object oriented programming
# concepts were successfully performed.