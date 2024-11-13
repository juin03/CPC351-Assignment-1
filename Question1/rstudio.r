# Read the original dataset
original <- read.csv("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Data/tracks_features.csv")

# Configuration parameters
num_files <- 1                # Counter for file naming
rows_segment <- 5             # Number of row segments to split into
cols_segment <- 8             # Number of column segments to split into
rows_per_file <- 250000      # Number of rows in each segment
cols_per_file <- 3           # Number of columns in each segment

# Create directory for storing split files
dir.create("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/separated_csv", showWarnings = FALSE)

# PART 1: Splitting the file
# Nested loop to split the original file both horizontally and vertically
# Outer loop (i) handles row segments
for (i in 1:rows_segment) {
  # Calculate row range for current segment
  start_row <- ((i - 1) * rows_per_file) + 1
  end_row <- min(i * rows_per_file, nrow(original))

  # Inner loop (j) handles column segments
  for (j in 1:cols_segment) {
    # Calculate column range for current segment
    start_col <- ((j - 1) * cols_per_file) + 1
    end_col <- min(j * cols_per_file, ncol(original))

    # Extract the subset of data for current segment
    smaller_data <- original[start_row:end_row, start_col:end_col]

    # Create filename with padding (e.g., spotify_01.csv) and save
    file_name <- sprintf("spotify_%02d.csv", num_files)
    full_path <- file.path("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/separated_csv", file_name)
    write.csv(smaller_data, full_path, row.names = FALSE)

    # Print information about the created file
    cat(sprintf("\nFile: %s\n", file_name))
    cat(sprintf("Number of rows: %d\n", nrow(smaller_data)))
    cat(sprintf("Columns: %s\n", paste(colnames(smaller_data), collapse=", ")))
    cat("----------------------------------------")

    num_files <- num_files + 1
  }
}

# PART 2: Recombining the files
# Initialize variable to store complete dataset
complete <- NULL

# Outer loop processes each row segment
for (i in 1:rows_segment) {
  row_segment_data <- NULL
  
  # Inner loop combines 8 files horizontally for current row segment
  for (j in 1:cols_segment) {
    # Calculate file number based on current position
    file_num <- (i - 1) * cols_segment + j
    
    # Read the corresponding file
    file_name <- sprintf("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/separated_csv/spotify_%02d.csv", file_num)
    temp_data <- read.csv(file_name)
    
    # Combine columns using cbind (column bind)
    # If first file in segment, initialize; otherwise append columns
    if (is.null(row_segment_data)) {
      row_segment_data <- temp_data
    } else {
      row_segment_data <- cbind(row_segment_data, temp_data)
    }
  }
  
  # Combine rows using rbind (row bind)
  # If first segment, initialize; otherwise append rows
  if (is.null(complete)) {
    complete <- row_segment_data
  } else {
    complete <- rbind(complete, row_segment_data)
  }
}

# Save final combined data
write.csv(complete, "C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/complete.csv", row.names = FALSE)


# Print dimensions with descriptive messages
cat("Original dataset dimensions:\n")
cat("Number of rows:", nrow(original), "\n")
cat("Number of columns:", ncol(original), "\n\n")

cat("Combined dataset dimensions:\n")
cat("Number of rows:", nrow(complete), "\n")
cat("Number of columns:", ncol(complete), "\n\n")

# Check data types of each column
data_types <- sapply(original, class)
print(data_types)
data_types <- sapply(complete, class)
print(data_types)


# Compare the content
if (identical(original, complete)) {
  print("The two files have the same content.")
} else {
  print("The two files have different content.")
}


# Initialize a counter for tracking the number of differences found
difference_count <- 0
max_differences <- 30

# Loop through each row and column to find differences
for (i in 1:min(nrow(original), nrow(complete))) {
  for (j in 1:min(ncol(original), ncol(complete))) {
    if (original[i, j] != complete[i, j]) {
      cat(sprintf("Difference found at Row %d, Column %d:\n", i, j))
      cat(sprintf("  Original: %s\n", original[i, j]))
      cat(sprintf("  Combined: %s\n\n", complete[i, j]))
      
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
