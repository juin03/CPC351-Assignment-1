library(dplyr)
library(data.table)

# Read CSV file using relative path
combined_data3 <- fread("Question3/Temp/2)Manufacturer_Extracted.csv")

# Convert 'actual_price' and 'discount_price' to numeric (float)
# gsub(pattern, replacement, x) replaces all occurrences of pattern in x with replacement
# ^ inside square brackets negates the expression
# "[^0-9.]" matches any character that is not a digit or a period
# It removes all non-numeric characters except the decimal point
combined_data3$actual_price <- as.numeric(gsub("[^0-9.]", "", combined_data3$actual_price))
combined_data3$discount_price <- as.numeric(gsub("[^0-9.]", "", combined_data3$discount_price))

# Convert 'no_of_ratings' to integer - remove commas first, then other non-numeric characters
combined_data3$no_of_ratings <- as.integer(gsub("[^0-9.]", "", combined_data3$no_of_ratings))

# convert 'ratings' to numeric
combined_data3$ratings <- as.numeric(combined_data3$ratings)

# Set ratings and no_of_ratings to 0 where they are null
combined_data3 <- combined_data3 %>%
  mutate(
    ratings = ifelse(is.na(ratings), 0, ratings),
    no_of_ratings = ifelse(is.na(no_of_ratings), 0, no_of_ratings)
  )

# Remove rows where actual_price is 0
# filter() is used to filter rows based on a condition
# %>%, is a pipe operator that is used to pass the result of one function as the input to the next function
combined_data3 <- combined_data3 %>%
  filter(actual_price != 0)

# Save the combined data using relative path
write.csv(combined_data3, "Question3/Temp/3)Cleaned_Data_Types.csv", row.names = FALSE)

# Check for the number of null (NA or empty) values in each column
null_count <- sapply(combined_data3, function(x) sum(is.na(x) | x == "" | x == "NA"))
print(null_count)

# Print datatypes of the numeric columns
numeric_columns <- c("actual_price", "discount_price", "no_of_ratings", "ratings")
print("Data types of the edited columns:")
for (col in numeric_columns) {
  print(paste(col, ":", class(combined_data3[[col]])))
}

# Count the total number of rows (samples)
total_samples_3c <- nrow(combined_data3)
print(paste("Total samples:", total_samples_3c))