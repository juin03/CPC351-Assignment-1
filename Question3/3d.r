library(dplyr)
library(data.table)
combined_data4 <- fread("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question3/Temp/3)Cleaned_Data_Types.csv")

# Few steps of cleaning are needed to be done
# 1. Check if there are products with actual_price less than or equal to discount_price
if (any(combined_data4$actual_price < combined_data4$discount_price, na.rm = TRUE)) {
  warning("There are products with actual_price less than or equal to discount_price")
}

# 2. Remove row with NA in actual_price
combined_data4 <- combined_data4[!is.na(combined_data4$actual_price), ]

# 3. Replace NA in discount_price with actual_price
combined_data4$discount_price[is.na(combined_data4$discount_price)] <- combined_data4$actual_price[is.na(combined_data4$discount_price)]

# Check for the number of null (NA or empty) values in each column
null_count <- sapply(combined_data4, function(x) sum(is.na(x) | x == "" | x == "NA"))
print(null_count)

# Calculate discount percentage
combined_data4 <- combined_data4 %>%
  mutate(discount_percentage = round(((actual_price - discount_price) / actual_price) * 100, 2))

# Save the combined data into a new CSV file
write.csv(combined_data4, "C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question3/Temp/4)Discount_Percentage.csv", row.names = FALSE)

