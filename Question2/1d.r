# In  2005,  Amazon  introduced  Amazon  Prime,  a  game-changer  in  online  shopping.  The 
# service led to rapid growth, expanding from X million members in 2011 to Y million in 
# 2021.  Find  the  values  of  X  and  Y  from  the  video.  Write  an  R function to calculate the 
# number  of  members  for  any  given  year  based  on  a  linear  growth  rate.  Use  linear 
# interpolation  to  estimate  the  number  of  members  for  a  given  target  year.  Test  the 
# function  by  using  2018  as  the  target  year  and  verify  the  output.  (Note:  Assume  the 
# membership numbers increase at a constant rate over time).

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