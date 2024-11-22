library(dplyr)
library(data.table)
combined_data7 <- fread("Question3/Temp/4)Discount_Percentage.csv", stringsAsFactors = FALSE)

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

# Print only name, manufacturer and discount_price for lowest & highest price products
lowest_price_product_selected <- lowest_price_product %>% 
  select(name, manufacturer, discount_price)
highest_price_product_selected <- highest_price_product %>% 
  select(name, manufacturer, discount_price)

# Display results
highest_price_product_selected
lowest_price_product_selected 
cat("Correlation between discount percentage and number of ratings (Pearson):", correlation, "\n")
cat("Correlation between discount percentage and number of ratings (Spearman):", spearman_cor, "\n")
