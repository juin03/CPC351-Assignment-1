# Read the CSV file using read.csv
original <- read.csv("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Data/tracks_features.csv")

# print(head(original))

# print(nrow(original))
# print(ncol(original))

num_files <- 1
rows_segment <- 5
cols_segment <- 8

# Set number of rows and columns per smaller file
rows_per_file <- 250000
cols_per_file <- 3

# Directory to save smaller files
dir.create("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/separated_csv", showWarnings = FALSE)

# Split and write each segment
for (i in 1:rows_segment) {
  start_row <- ((i - 1) * rows_per_file) + 1
  end_row <- min(i * rows_per_file, nrow(original))
  
  for (j in 1:cols_segment) {
    start_col <- ((j - 1) * cols_per_file) + 1
    end_col <- min(j * cols_per_file, ncol(original))
    
    smaller_data <- original[start_row:end_row, start_col:end_col]
    
    # Save each part as a separate CSV with leading zeros in file names
    file_name <- sprintf("spotify_%02d.csv", num_files)
    full_path <- file.path("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/separated_csv", file_name)
    write.csv(smaller_data, full_path, row.names = FALSE)
    num_files <- num_files + 1
  }
}

# Loop over each row segment
all_data <- NULL

for (i in 1:rows_segment) {
  row_segment_data <- NULL
  
  # Read and combine 8 files horizontally
  for (j in 1:cols_segment) {
    # Calculate the file number based on segment
    file_num <- (i - 1) * cols_segment + j
    
    # Ensuring file name format is spotify_01.csv, etc.
    file_name <- sprintf("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/separated_csv/spotify_%02d.csv", file_num)
    
    # Read file
    temp_data <- read.csv(file_name)
    
    # Combine columns horizontally
    if (is.null(row_segment_data)) {
      row_segment_data <- temp_data
    } else {
      row_segment_data <- cbind(row_segment_data, temp_data)
    }
  }
  
  # Combine rows vertically
  if (is.null(all_data)) {
    all_data <- row_segment_data
  } else {
    all_data <- rbind(all_data, row_segment_data)
  }
}

# Save final combined data
write.csv(all_data, "C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/complete.csv", row.names = FALSE)

combined_data <- read.csv("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/complete.csv")

# Compare the content
if (identical(original, combined_data)) {
  print("The two files have the same content.")
} else {
  print("The two files have different content.")
}

# Check data types of each column
data_types <- sapply(original, class)
print(data_types)
data_types <- sapply(combined_data, class)
print(data_types)

# q(save = "ask")


# Initialize a counter for tracking the number of differences found
difference_count <- 0
max_differences <- 30

# Loop through each row and column to find differences
for (i in 1:min(nrow(original), nrow(combined_data))) {
  for (j in 1:min(ncol(original), ncol(combined_data))) {
    if (original[i, j] != combined_data[i, j]) {
      cat(sprintf("Difference found at Row %d, Column %d:\n", i, j))
      cat(sprintf("  Original: %s\n", original[i, j]))
      cat(sprintf("  Combined: %s\n\n", combined_data[i, j]))
      
      # Increment the difference counter
      difference_count <- difference_count + 1
      
      # Stop after printing the first 30 differences
      if (difference_count >= max_differences) {
        stop("Printed the first 30 differences. Stopping now.")
      }
    }
  }
}

# If no differences are found, print a message
if (difference_count == 0) {
  print("No differences found between the two data frames.")
}
