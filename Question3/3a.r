# Load necessary library
library(dplyr)
library(data.table)

# Set the path to the folder containing all 108 CSV files
folder_path <- "Data/Amazon_Products"

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
fwrite(combined_data, "./Question3/temo/Amazon_Products_All.csv", row.names = FALSE)

# Count the total number of rows (samples)
total_samples <- nrow(combined_data)
print(paste("Total samples in the dataset:", total_samples))
