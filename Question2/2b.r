# Function to get input from the user and ensure it's between 1 and 10
get_valid_input <- function(prompt_text) {
  repeat {
    value <- as.integer(readline(prompt_text))
    if (!is.na(value) && value >= 1 && value <= 10) {
      return(value)
    } else {
      cat("Invalid input. Please enter a value between 1 and 10.\n")
    }
  }
}

# Get user input for each factor
margin <- get_valid_input("Enter margin score (1-10): ")
price_sensitivity <- get_valid_input("Enter price sensitivity score (1-10): ")
delivery_preferences <- get_valid_input("Enter delivery preferences score (1-10): ")

# Calculate total score
total_score <- margin + price_sensitivity + delivery_preferences

# Evaluate profitability classification and print detailed message
if (total_score > 25) {
  print(paste("Total score is", total_score, "hence it is High Profitability"))
} else if (total_score >= 15 && total_score <= 25) {
  print(paste("Total score is", total_score, "hence it is Moderate Profitability"))
} else {
  print(paste("Total score is", total_score, "hence it is Low Profitability"))
}
