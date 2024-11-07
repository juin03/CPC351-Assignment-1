# Assign scores to each factor 
margins_score <- 10
price_sensitivity_score <- 7
delivery_preferences_score <- 8

# Calculate Total Score
total_score <- margins_score + price_sensitivity_score + delivery_preferences_score

# Classify profitability
if (total_score > 25) {
  profitability <- "High Profitability"
} else if (total_score >= 15 && total_score <= 25) {
  profitability <- "Moderate Profitability"
} else {
  profitability <- "Low Profitability"
}

# Print the profitability classification
print(profitability)