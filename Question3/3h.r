library(data.table)

data <- fread("Question3/Amazon_Products_With_Discount.csv")

# Determine the product with the highest no_of_ratings
highest_no_of_ratings_product <- data[order(-no_of_ratings)][1]

# Sort the data in descending order of no_of_ratings
sorted_data <- data[order(-no_of_ratings)]

# Print the product with the highest no_of_ratings
print(highest_no_of_ratings_product)

# Print the sorted data
print(sorted_data)

fwrite(sorted_data, "Question3/Amazon_Products_Sorted_By_Sales.csv")
