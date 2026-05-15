#ASSIGNMENT NO.6: Data Aggregation, Cross-Tabulation, Exploring Frequency and Contingency Tables in R

#Q1) Sales Performance Analysis 
#a) Total sales by region 
#b) Average sales per gender 
#c) Frequency distribution of purchase 
#d) Cross-tab: Region vs Purchase 
#e) Chi-square test

library(dplyr)

# a) Total sales by region
total_sales_region <- aggregate(FinalAmount ~ City, sales_data, sum)

# b) Average sales per gender (assuming Gender column exists)
avg_sales_gender <- aggregate(FinalAmount ~ Gender, sales_data, mean)

# c) Frequency distribution of purchase
freq_purchase <- table(sales_data$Product)# a) Count customers by region
count_customers_region <- table(sales_data$City)

# b) Average purchase by region using tapply
avg_purchase_region <- tapply(sales_data$FinalAmount, sales_data$City, mean)

# c) Frequency of gender
freq_gender <- table(sales_data$Gender)

# d) Cross-tab: Gender vs Region
cross_gender_region <- table(sales_data$Gender, sales_data$City)

# e) Chi-square test (Gender vs Region)
chisq_test_gender_region <- chisq.test(cross_gender_region)


# d) Cross-tab: Region vs Purchase
cross_region_purchase <- table(sales_data$City, sales_data$Product)

# e) Chi-square test (Region vs Purchase)
chisq_test_region_purchase <- chisq.test(cross_region_purchase)


#Q2) Customer Segmentation 
#a) Count customers by region 
#b) Average purchase by region using tapply 
#c) Frequency of gender 
#d) Cross-tab: Gender vs Region 
#e) Chi-square test
# a) Count customers by region
count_customers_region <- table(sales_data$City)

# b) Average purchase by region using tapply
avg_purchase_region <- tapply(sales_data$FinalAmount, sales_data$City, mean)

# c) Frequency of gender
freq_gender <- table(sales_data$Gender)

#Q3) Purchase Pattern Analysis 
#a) Total purchase amount 
#b) Row-wise sum using apply 
#c) Frequency of purchase 
#d) Cross-tab: Purchase vs Region 
#e) Chi-square test

# a) Total purchase amount
total_purchase <- sum(sales_data$FinalAmount)

# b) Row-wise sum using apply (Revenue + DiscountAmount + FinalAmount)
rowwise_sum <- apply(sales_data[, c("Revenue","DiscountAmount","FinalAmount")], 1, sum)

# c) Frequency of purchase (Product)
freq_purchase <- table(sales_data$Product)

# d) Cross-tab: Purchase vs Region
cross_purchase_region <- table(sales_data$Product, sales_data$City)

# e) Chi-square test
chisq_test_purchase_region <- chisq.test(cross_purchase_region)

 
cross_gender_region <- table(sales_data$Gender, sales_data$City)

# e) Chi-square test (Gender vs Region)
chisq_test_gender_region <- chisq.test(cross_gender_region)


#Q4) High-Value Customer Analysis 
#a) Filter customers with Amount > 5000 
#b) Mean purchase of filtered group 
#c) Frequency of region (filtered) 
#d) Cross-tab: Gender vs Purchase (filtered) 
#e) Chi-square test 

# a) Filter customers with Amount > 5000
high_value <- filter(sales_data, FinalAmount > 5000)

# b) Mean purchase of filtered group
mean_high_value <- mean(high_value$FinalAmount)

# c) Frequency of region (filtered)
freq_region_high <- table(high_value$City)

# d) Cross-tab: Gender vs Purchase (filtered)
cross_gender_purchase_high <- table(high_value$Gender, high_value$Product)

# e) Chi-square test
chisq_test_gender_purchase_high <- chisq.test(cross_gender_purchase_high)


#Q5) Business Decision Analysis 
#a) Total revenue 
#b) Average revenue per region 
#c) Frequency distribution of regions 
#d) Cross-tab: Region vs Purchase 
#e) Statistical inference

# a) Total revenue
total_revenue <- sum(sales_data$Revenue)

# b) Average revenue per region
avg_revenue_region <- tapply(sales_data$Revenue, sales_data$City, mean)

# c) Frequency distribution of regions
freq_region <- table(sales_data$City)

# d) Cross-tab: Region vs Purchase
cross_region_purchase <- table(sales_data$City, sales_data$Product)

# e) Statistical inference (Chi-square test)
chisq_test_region_purchase <- chisq.test(cross_region_purchase)




