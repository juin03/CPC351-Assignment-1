# Read the original dataset
original <- read.csv("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Data/tracks_features.csv")

# Configuration parameters
num_files <- 1               # Counter for sequential file naming
rows_segment <- 5            # Number of segments to split rows into
cols_segment <- 8            # Number of segments to split columns into
rows_per_file <- 250000     # Number of rows in each segment
cols_per_file <- 3          # Number of columns in each segment

# Create directory for storing split files if it doesn't exist
dir.create("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/separated_csv", showWarnings = FALSE)

#######################
# PART 1: File Splitting
#######################
# This section splits the original file both horizontally and vertically
# - Creates a total of rows_segment * cols_segment files
# - Each file contains a subset of rows and columns from the original


# Nested loop is used to split the original file both horizontally and vertically

# Outer loop (i) handles row segments
for (i in 1:rows_segment) {
  # Calculate the starting and ending row indices for the current segment
  # min() is used to ensure we don't exceed the total number of rows in the original dataset
  # For example, if i = 5, end_row = min(5 * 250000, nrow(original)) = min(1250000, 1204025) = 1204025
  start_row <- ((i - 1) * rows_per_file) + 1
  end_row <- min(i * rows_per_file, nrow(original))

  # Inner loop (j) handles column segments
  for (j in 1:cols_segment) {
    # Calculate the starting and ending column indices for this segment
    # min() is used to ensure we don't exceed the total number of columns in the original dataset
    # For example, if j = 6, end_col = min(6 * 3, ncol(original)) = min(18, 24) = 18
    start_col <- ((j - 1) * cols_per_file) + 1
    end_col <- min(j * cols_per_file, ncol(original))

    # Extract the subset of data for current segment
    # : here we are extracting rows from start_row to end_row and columns from start_col to end_col
    # This creates a smaller dataframe with specific rows and columns
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

    # Increment the file counter
    num_files <- num_files + 1
  }
}

#######################
# PART 2: File Recombination
#######################
# This section reassembles the split files back into a single dataset
# - First combines files horizontally within each row segment
# - Then combines all row segments vertically

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

#######################
# PART 3: Validation
#######################
# This section performs various checks to ensure data integrity:
# 1. Compares dimensions of original and combined datasets
# 2. Verifies data types of all columns
# 3. Performs detailed content comparison
# 4. Reports up to 30 differences if found

# Print dimensions comparison
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

# Compare the content of the original and combined datasets row by row
if (identical(original, complete)) {
  print("The two files have the same content.")
} else {
  print("The two files have different content.")
}

# Initialize a counter for tracking the number of differences found
difference_count <- 0
max_differences <- 10

# Loop through each row and column to find differences
# only 10 differences are printed to avoid overwhelming the console
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

#######################
# CODE VERSION 2: Data Type-Safe Implementation
#######################
# This version differs from the first implementation by:
# 1. Enforcing character data types throughout the process
# 2. Preventing automatic type conversion during file operations
# 3. Using a separate directory for split files (separated2_csv)
# 4. Simplified validation approach

# Define column classes to ensure consistent data types
column_classes <- rep("character", 24)  # Force all 24 columns to be read as character type
separated_column_classes <- rep("character", 3)  # Force all 3 columns in split files to be character type

# Read the CSV file using read.csv
original <- read.csv("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Data/tracks_features.csv", colClasses = column_classes)

num_files <- 1
rows_segment <- 5
cols_segment <- 8
rows_per_file <- 250000
cols_per_file <- 3

# Create a new directory for this version to keep files separate from the first attempt
dir.create("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/separated2_csv", showWarnings = FALSE)

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
    write.csv(smaller_data,
              file.path("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/separated2_csv", file_name),
              row.names = FALSE)
    num_files <- num_files + 1
  }
}

# Loop over each row segment
all_data <- NULL
# Key difference in the recombination process:
# When reading split files, we explicitly set column types to character
# This ensures no automatic type conversion occurs during the process
for (i in 1:rows_segment) {
  row_segment_data <- NULL

  # Read and combine 8 files horizontally
  for (j in 1:cols_segment) {
    # Calculate the file number based on segment
    file_num <- (i - 1) * cols_segment + j

    # Ensuring file name format is spotify_01.csv, etc.
    file_name <- sprintf("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/separated2_csv/spotify_%02d.csv", file_num)

    # Read file
    temp_data <- read.csv(file_name, colClasses = separated_column_classes)

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
write.csv(all_data, "C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/complete2.csv", row.names = FALSE)

complete2 <- read.csv("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/complete2.csv", colClasses = column_classes)

# Compare the content
if (identical(original, complete2)) {
  print("The two files have the same content.")
} else {
  print("The two files have different content.")
}
