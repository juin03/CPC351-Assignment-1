# Given  that  Walmart  operates  X  stores  and  clubs  worldwide  and  serving  Y  million 
# customers  per  week,  write  a  conditional  statement  in  R  to  categorize  the  average 
# number of customers per store per week. Find out the values of X and Y from the video.  
# Define 3 different types of categories to classify the number of weekly customers per 
# week.  Calculate  the  average  number  of  weekly  customers  per  store,  then  write  a 
# conditional statement in R to assign the appropriate category. Print the category along 
# with a message indicating the number of customers per week. 
# (Note: Provide your own assumptions when defining the 3 categories of customers per 
# week)

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
