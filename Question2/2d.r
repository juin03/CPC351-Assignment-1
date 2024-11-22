estimate_member_number <- function(year) {
  starting_year <- 2011
  current_year <- 2021

  starting_member <- 4 * 10^6
  current_member <- 200 * 10^6

  # Calculate the growth rate
  growth_rate <- (current_member - starting_member) / (current_year - starting_year)

  # Calculate the estimated number of members for the given year
  estimated_member <- starting_member + growth_rate * (year - starting_year)
  return(estimated_member)
}

target_year <- 2018
cat("Estimated Amazon Prime membership in", target_year, "is", estimate_member_number(target_year)
, "members\n")