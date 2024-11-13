# Load necessary library
library(dplyr)
library(data.table)

# Set the path to the folder containing all 108 CSV files
folder_path <- "./Data/AmazonProducts"

dir.create("./Question3/Temp", showWarnings = FALSE)

# Get a list of all CSV files in the folder
# list.files() returns a character vector of the files from the folder
# full.names = TRUE returns the full path to all of the files in the folder
file_list <- list.files(path = folder_path, pattern = "*.csv", full.names = TRUE)

print(file_list)

# Read all CSV files and combine them into a single data frame
# lapply() applies the read.csv() function to each file in the file_list
# do.call(rbind, ...) combines the resulting data frames into a single data frame
combined_data <- do.call(rbind, lapply(file_list, fread))

# Save the combined data into a new CSV file
write.csv(combined_data, "./Question3/Temp/1)Amazon_Products_All.csv", row.names = FALSE)

# Check for the number of null (NA or empty) values in each column
null_count <- sapply(combined_data, function(x) sum(is.na(x) | x == "" | x == "NA"))
print(null_count)