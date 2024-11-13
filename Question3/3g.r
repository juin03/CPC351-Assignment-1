library(dplyr)
combined_data7 <- read.csv("./Question3/Temp/4)Discount_Percentage.csv", stringsAsFactors = FALSE)

# Product with the highest price
highest_price_product <- combined_data7[which.max(combined_data7$discount_price), ]

# Product with the lowest price (excluding 0 prices and 0 discount percentages)
lowest_price_product <- combined_data7[which.min(combined_data7$discount_price[
  combined_data7$discount_price > 0
]), ]

# Calculate correlation between discount percentage and number of ratings
# cor() computes the Pearson correlation coefficient, which measures the linear relationship between the two variables.
# use = "complete.obs" specifies that rows with missing values should be excluded from the calculation.
correlation <- cor(combined_data7$discount_percentage, combined_data7$no_of_ratings, use = "complete.obs")

# Try Spearman correlation to spot non-linear relationships
spearman_cor <- cor(combined_data7$discount_percentage, combined_data7$no_of_ratings, use = "complete.obs", method = "spearman")

# Print the entire row for lowest & highest price product (removed the select statement)
lowest_price_product_selected <- lowest_price_product
highest_price_product_selected <- highest_price_product

# Display results
highest_price_product_selected 
lowest_price_product_selected 
print(correlation)
print(spearman_cor)
