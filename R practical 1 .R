#Q1


rm(list = ls())
a <- as.numeric(readline("Enter first number: "))
b <- as.numeric(readline("Enter second number:"))
result<- c(a+b, a-b, a*b, a/b, a^b, a%%b)

print(result)
print(max(result))
print(min(result))
print(mean(result))

#Q2

nums <- sample(1:100,10)
sqrt_vals <- sqrt(nums)
round_vals <- round(sqrt_vals)
ceil_vals <- ceiling(sqrt_vals)
floor_vals <- floor(sqrt_vals)

df <- data.frame(nums, sqrt_vals, round_vals, ceil_vals, floor_vals)

print(df)

#Q3

names <- c("ram", "sita", "amit", "rahul")
upper_names <- toupper(names)
length_names <- nchar(names)
result <- paste("Name:", upper_names, "- Length:", length_names)
print(result)

#Q4
nums <- 1:200

filtered <- nums[nums %% 3 == 0 & nums %% 5 == 0]

square_vals <- filtered^2
sqrt_vals <- sqrt(filtered)

df <- data.frame(filtered, square_vals, sqrt_vals)

print(df)

#Q5

a <- as.numeric(readline("Enter a: "))
b <- as.numeric(readline("Enter b: "))
c <- as.numeric(readline("Enter c: "))

D <- b^2 - 4*a*c

if (D > 0) {
  x1 <- (-b + sqrt(D)) / (2*a)
  x2 <- (-b - sqrt(D)) / (2*a)
  print(c(x1, x2))
} else if (D == 0) {
  x <- -b / (2*a)
  print(x)
} else {
  real <- -b / (2*a)
  imag <- sqrt(-D) / (2*a)
  print(paste(real, "+", imag, "i"))
  print(paste(real, "-", imag, "i"))
}









