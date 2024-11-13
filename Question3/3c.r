library(dplyr)
combined_data3 <- read.csv("./Question3/Temp/2)Manufacturer_Extracted.csv", stringsAsFactors = FALSE)

# Convert 'actual_price' and 'discount_price' to numeric (float)
# gsub(pattern, replacement, x) replaces all occurrences of pattern in x with replacement
# ^ inside square brackets negates the expression
# "[^0-9.]" matches any character that is not a digit or a period
# It removes all non-numeric characters except the decimal point
combined_data3$actual_price <- as.numeric(gsub("[^0-9.]", "", combined_data3$actual_price))
combined_data3$discount_price <- as.numeric(gsub("[^0-9.]", "", combined_data3$discount_price))

# First, let's examine some problematic values before conversion
print("Sample of ratings before conversion:")
print(head(combined_data3$ratings[!is.na(combined_data3$ratings)]))
print("Sample of no_of_ratings before conversion:")
print(head(combined_data3$no_of_ratings[!is.na(combined_data3$no_of_ratings)]))

# Convert 'no_of_ratings' to integer - remove commas first, then other non-numeric characters
combined_data3$no_of_ratings <- as.integer(gsub("[^0-9]", "", gsub(",", "", combined_data3$no_of_ratings)))

# # Diagnostic checks for ratings
# print("Number of NA values before conversion:")
# print(sum(is.na(combined_data3$ratings)))

# print("Sample of unique ratings values before conversion:")
# print(unique(head(combined_data3$ratings, 100)))

# print("Sample of problematic ratings (non-numeric values):")
# problematic_ratings <- combined_data3$ratings[!is.na(combined_data3$ratings) & !grepl("^[0-9]\\.[0-9]+$", combined_data3$ratings)]
# print(head(problematic_ratings, 20))

# First convert empty strings to NA, then convert to numeric
combined_data3$ratings[combined_data3$ratings == ""] <- NA
combined_data3$ratings <- as.numeric(combined_data3$ratings)

print("Number of NA values after conversion:")
print(sum(is.na(combined_data3$ratings)))

# Save the combined data into a new CSV file
write.csv(combined_data3, "./Question3/Temp/3)Cleaned_Data_Types.csv", row.names = FALSE)

# Check for the number of null (NA or empty) values in each column
null_count <- sapply(combined_data3, function(x) sum(is.na(x) | x == "" | x == "NA"))
print(null_count)