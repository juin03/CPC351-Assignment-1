# Given values
X <- 10500         # Number of stores
Y <- 230           # Millions of customers per week

# Calculate the average number of customers per store per week
average_customers_per_store <- (Y * 10^6) / X

# Classify based on average customers per store
if (average_customers_per_store > 28000) {
  traffic_category <- "High Traffic"
} else if (average_customers_per_store >= 18000 && average_customers_per_store <= 28000) {
  traffic_category <- "Moderate Traffic"
} else {
  traffic_category <- "Low Traffic"
}

# Print the traffic category along with a message
message <- paste("Average number of weekly customers per store:", round(average_customers_per_store),
                 "-", traffic_category, "category.")
print(message)