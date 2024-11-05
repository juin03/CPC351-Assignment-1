# Corrected Paths to the complete and original CSV files
complete_path <- "C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Question1/complete.csv"
original_path <- "C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1/Data/tracks_features.csv"

# Verify that both files exist before proceeding
if (!file.exists(complete_path)) {
  stop("The file at complete_path does not exist. Please check the path.")
}

if (!file.exists(original_path)) {
  stop("The file at original_path does not exist. Please check the path.")
}

# Load both datasets with error handling
combined_data <- tryCatch(
  read.csv(complete_path),
  error = function(e) {
    message("Error loading combined_data from complete_path: ", e$message)
    return(NULL)
  }
)

original_data <- tryCatch(
  read.csv(original_path),
  error = function(e) {
    message("Error loading original_data from original_path: ", e$message)
    return(NULL)
  }
)

# Proceed only if both datasets loaded successfully
if (is.null(combined_data) || is.null(original_data)) {
  stop("One or both files could not be loaded. Please check the file contents and format.")
}

# Use identical() to check if they are exactly the same
if (identical(original_data, combined_data)) {
  print("The two files have the same content.")
} else {
  print("The two files have different content.")
  
  # Identify differing rows and columns for more detailed comparison
  differing_indices <- which(original_data != combined_data, arr.ind = TRUE)
  
  if (nrow(differing_indices) > 0) {
    # Count unique row indices where differences occur
    differing_rows <- unique(differing_indices[, 1]) # Unique row indices of differing rows
    num_differing_rows <- length(differing_rows) # Count of unique differing rows
    
    print(paste("Number of differing rows:", num_differing_rows))
    print("Differing rows and columns:")
    print(differing_indices)
    
    # Show sample differences from original_data and combined_data
    print("Sample of differences in original_data:")
    print(original_data[differing_rows[1:min(10, num_differing_rows)], ])
    print("Sample of differences in combined_data:")
    print(combined_data[differing_rows[1:min(10, num_differing_rows)], ])
  }
}
