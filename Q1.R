# Load the full dataset
tracks_features <- read.csv("C:/Users/thjthomas/OneDrive - Universiti Sains Malaysia/YEAR 3 SEM 1/CPC351/tracks_features.csv")

# Set parameters for splitting
rows_per_file <- 250000
cols_per_file <- 3
total_rows <- nrow(tracks_features)
total_cols <- ncol(tracks_features)

# Initialize file counter
file_counter <- 1

# Split and save each part by both rows and columns
for (row_start in seq(1, total_rows, by = rows_per_file)) {
  row_end <- min(row_start + rows_per_file - 1, total_rows)
  row_subset <- tracks_features[row_start:row_end, ]
  
  for (col_start in seq(1, total_cols, by = cols_per_file)) {
    col_end <- min(col_start + cols_per_file - 1, total_cols)
    col_subset <- row_subset[, col_start:col_end]
    file_name <- paste0("spotify_", sprintf("%02d", file_counter), ".csv")
    write.csv(col_subset, file = file_name, row.names = FALSE)
    file_counter <- file_counter + 1
  }
}

# Define parameters for combining files
rows_segment <- 5
cols_segment <- 8

# Initialize list to store data frames for each row segment
all_rows <- list()

# Loop through each row segment
for (i in 1:rows_segment) {
  # Initialize list to store data frames for each column segment within the row segment
  row_data <- list()
  
  # Loop through each file in the current row segment
  for (j in 1:cols_segment) {
    # Calculate file index based on row and column position
    file_index <- (i - 1) * cols_segment + j
    file_name <- paste0("spotify_", sprintf("%02d", file_index), ".csv")
    
    # Read CSV file and add to row data
    data <- read.csv(file_name)
    row_data[[j]] <- data
  }
  
  # Combine the data frames in the current row segment by column
  combined_row <- do.call(cbind, row_data)
  
  # Add the combined row to the list of all rows
  all_rows[[i]] <- combined_row
}

# Combine all rows into a single data frame by row
complete_data <- do.call(rbind, all_rows)

# Write the final combined data to a CSV file
write.csv(complete_data, file = "complete.csv", row.names = FALSE)

complete <- read.csv("complete.csv")

result <- all.equal(tracks_features, complete)
if (isTRUE(result)) {
  cat("The two files have the same content.\n")
} else {
  cat("Differences found:\n", result, "\n")
}