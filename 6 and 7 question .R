#genrate numbers from 1 to 200
#find numbers:
# dividible by 3 OR 7
# Divisible by both 3 and 7

nums <- 1:200
div_3_or_7 <- nums[nums %% 3 == 0 | nums %% 7 == 0]
div_3_and_7 <- nums[num%%3 == 0 & nums%% 7 == 0]
div_3_or_7
div_3_and_7
#problem_2
#x<- c (10,20,NA,30,NA,40)
#find:
# sum ignoring NA 
#REplace NA with mean

x<- c (10,20,NA,30,NA,40)
sum_x <- sum(x, na.rm = TRUE)
sum_x
x[is.na(x)] <- mean(x, na.rm = TRUE)
x