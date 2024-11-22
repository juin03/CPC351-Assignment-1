# Load necessary library
library(dplyr)
library(data.table)

# Set the path to the folder containing all 108 CSV files
folder_path <- "C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Data/AmazonProducts"

dir.create("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question3/Temp", showWarnings = FALSE)

# Get a list of all CSV files in the folder
# list.files() returns a character vector of the files from the folder
# full.names = TRUE returns the full path to all of the files in the folder
file_list <- list.files(path = folder_path, pattern = "*.csv", full.names = TRUE)

print(file_list)

# Read all CSV files and combine them into a single data frame
# lapply() applies the read.csv() function to each file in the file_list
# do.call(rbind, ...) combines the resulting data frames into a single data frame
combined_data <- do.call(rbind, lapply(file_list, fread))

# Check for the number of null values in each column before preprocessing
null_count <- sapply(combined_data, function(x) sum(is.na(x) | x == "" | x == "NA"))
print(null_count)

# Preprocessing steps
# 1. Convert empty strings to NA in specified columns
combined_data_cleaned <- combined_data %>%
  mutate(
    ratings = na_if(ratings, ""),
    no_of_ratings = na_if(no_of_ratings, ""),
    actual_price = na_if(actual_price, ""),
    discount_price = na_if(discount_price, "")
  )

# 2. Assign actual_price to discount_price where discount_price is null
combined_data_cleaned$discount_price[is.na(combined_data_cleaned$discount_price)] <-
  combined_data_cleaned$actual_price[is.na(combined_data_cleaned$discount_price)]

# 3. Remove rows where actual_price is 0 or NA
combined_data_cleaned <- combined_data_cleaned %>%
  filter(!is.na(actual_price))

# 4. Set ratings and no_of_ratings to 0 where they are null
combined_data_cleaned <- combined_data_cleaned %>%
  mutate(
    ratings = ifelse(is.na(ratings), 0, ratings),
    no_of_ratings = ifelse(is.na(no_of_ratings), 0, no_of_ratings)
  )

# Save the preprocessed data
write.csv(combined_data_cleaned, "C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question3/Temp/1)Amazon_Products_All.csv", row.names = FALSE)

# Check for the number of null values in each column after preprocessing
null_count <- sapply(combined_data_cleaned, function(x) sum(is.na(x) | x == "" | x == "NA"))
print(null_count)

# Count the total number of rows (samples) before preprocessing
total_samples_before <- nrow(combined_data)
# Count the total number of rows (samples) after preprocessing
total_samples_after <- nrow(combined_data_cleaned)

# Print the total number of rows (samples) before and after preprocessing
print(paste("Total samples before preprocessing:", total_samples_before))
print(paste("Total samples after preprocessing:", total_samples_after))