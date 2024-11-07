# Function to estimate Amazon Prime members in a given year
estimate_members <- function(target_year) {
  # Known data points
  year_start <- 2011
  members_start <- 4        # Million members in 2011
  
  year_end <- 2021
  members_end <- 200        # Million members in 2021
  
  # Calculate the annual growth rate
  annual_growth_rate <- (members_end - members_start) / (year_end - year_start)
  
  # Calculate the estimated number of members for the target year
  estimated_members <- members_start + (target_year - year_start) * annual_growth_rate
  
  return(estimated_members)
}

# Test the function for the year 2018
target_year <- 2018
estimated_members_2018 <- estimate_members(target_year)

# Print the result
cat("Estimated Amazon Prime members in", target_year, ":", round(estimated_members_2018), "million\n")