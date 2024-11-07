setwd("C:/Users/thjthomas/OneDrive - Universiti Sains Malaysia/YEAR 3 SEM 1/CPC351/Amazon Products")

file_list <- list.files(pattern = "*.csv")
all_data <- do.call(rbind, lapply(file_list, read.csv, header = TRUE))
write.csv(all_data, "Amazon_Products_All.csv", row.names = FALSE)

# Count the total number of rows in the combined dataset
total_samples <- nrow(all_data)

# Print the total number of samples
print(total_samples)