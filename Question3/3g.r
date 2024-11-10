library(data.table)

data <- fread("Question3/Amazon_Products_Corrected.csv")

# Identify the products with the highest and lowest prices
highest_price_product <- data[which.max(data$actual_price)]
lowest_price_product <- data[which.min(data$actual_price)]

# Manufacturer of the product with the highest price
highest_price_manufacturer <- highest_price_product$manufacturer

# Calculate the discount (assuming discount is calculated as Discount = Actual_Price - Discount_Price)
data[, discount := actual_price - discount_price]

# Analyze the relationship between the discount and the number of ratings
discount_ratings_relationship <- lm(discount ~ ratings, data = data)

# Print the results
cat("Product with the highest price:\n")
print(highest_price_product)
cat("\nProduct with the lowest price:\n")
print(lowest_price_product)
cat("\nManufacturer of the product with the highest price:\n")
print(highest_price_manufacturer)
cat("\nSummary of the relationship between discount and number of ratings:\n")
print(summary(discount_ratings_relationship))