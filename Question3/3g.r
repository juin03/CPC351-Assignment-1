library(data.table)

data <- fread("Question3/temo/Amazon_Products_With_Discount.csv")

data <- data[!is.na(no_of_ratings) & !is.na(actual_price)]

data$discount_price[is.na(data$discount_price)] <-
  data$actual_price[is.na(data$discount_price)]

# Identify the products with the highest and lowest prices
highest_price_product <- data[which.max(data$actual_price)]
lowest_price_product <- data[which.min(data$actual_price)]

# Manufacturer of the product with the highest price
highest_price_manufacturer <- highest_price_product$manufacturer

# Calculate the discount (assuming discount is calculated as Discount = Actual_Price - Discount_Price)
data[, discount := actual_price - discount_price]

# Analyze the relationship between the discount and the number of ratings using correlation
discount_ratings_correlation <- cor(data$discount, data$no_of_ratings, use = "complete.obs")

# Print the results
cat("Product with the highest price:\n")
print(highest_price_product)
cat("\nProduct with the lowest price:\n")
print(lowest_price_product)
cat("\nManufacturer of the product with the highest price:\n")
print(highest_price_manufacturer)
cat("\nCorrelation between discount and number of ratings:\n")
print(discount_ratings_correlation)