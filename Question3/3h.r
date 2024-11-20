library(dplyr)
library(data.table)
combined_data8 <- fread("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question3/Temp/4)Discount_Percentage.csv", stringsAsFactors = FALSE)

# Sort by number of ratings to find highest sales
combined_data8 <- combined_data8 %>%
  arrange(desc(no_of_ratings))

# Product with the highest sales
highest_sales_product <- combined_data8[1, ]
highest_sales_product

write.csv(combined_data8, "C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question3/Temp/8)Arranged_by_Sales.csv", row.names = FALSE)