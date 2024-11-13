library(dplyr)
combined_data3 <- read.csv("./Question3/Temp/2)Manufacturer_Extracted.csv", stringsAsFactors = FALSE)

# Convert 'actual_price' and 'discount_price' to numeric (float)
# gsub(pattern, replacement, x) replaces all occurrences of pattern in x with replacement
# ^ inside square brackets negates the expression
# "[^0-9.]" matches any character that is not a digit or a period
# It removes all non-numeric characters except the decimal point
combined_data3$actual_price <- as.numeric(gsub("[^0-9.]", "", combined_data3$actual_price))
combined_data3$discount_price <- as.numeric(gsub("[^0-9.]", "", combined_data3$discount_price))

# Convert 'no_of_ratings' to integer
# Remove commas from 'no_of_ratings' and convert it to integer
combined_data3$no_of_ratings <- as.integer(gsub("[^0-9.]", "", combined_data3$no_of_ratings))

# Convert 'ratings' to numeric (float)
combined_data3$ratings <- as.numeric(combined_data2$ratings)

# Save the combined data into a new CSV file
write.csv(combined_data3, "./Question3/Temp/3)Cleaned_Data_Types.csv", row.names = FALSE)

# Check for the number of null (NA or empty) values in each column
null_count <- sapply(combined_data3, function(x) sum(is.na(x) | x == "" | x == "NA"))
print(null_count)