library(dplyr)
library(data.table)

# Read CSV file using relative path
combined_data8 <- fread("Question3/Temp/4)Discount_Percentage.csv", stringsAsFactors = FALSE)

# Sort by number of ratings to find highest sales
combined_data8 <- combined_data8 %>%
  arrange(desc(no_of_ratings))

# Get top 5 products with highest sales and select specific columns
highest_sales_products <- combined_data8[1:5, ] %>%
  select(name, no_of_ratings)

# Save the combined data using relative path
write.csv(combined_data8, "Question3/Temp/8)Arranged_by_Sales.csv", row.names = FALSE)

# Print top 5 products (name and ratings only)
print(highest_sales_products)