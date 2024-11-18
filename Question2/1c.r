# Number of stores and clubs worldwide
X <- 10500

# Total customers per week
Y <- 230 * 10^6

# Average number of customers per store per week
average <- round(Y / X)

# Define categories based on average number of customers per store per week
if(average > 5000) {
  print(paste("High Traffic Stores:", average, "customers per store per week"))
} else if(average >= 2000 && average <= 5000) {
  print(paste("Moderate Traffic Stores:", average, "customers per store per week"))
} else {
  print(paste("Low Traffic Stores:", average, "customers per store per week"))
}
