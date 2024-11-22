library(dplyr)
library(data.table)

# Read CSV file using relative path
combined_data6 <- fread("Question3/Temp/4)Discount_Percentage.csv", stringsAsFactors = FALSE)

# Filter ratings between 0.0 and 5.0
combined_data6 <- combined_data6 %>%
  filter(ratings >= 0 & ratings <= 5)

# Categorize ratings and overwrite the ratings column
combined_data6 <- combined_data6 %>%
  mutate(ratings = case_when(
    ratings > 3.0 ~ "High",
    ratings >= 1.5 & ratings <= 3.0 ~ "Medium",
    ratings < 1.5 ~ "Low",
    TRUE ~ "Unknown"  # In case there are missing ratings
  ))

# Save the combined data using relative path
write.csv(combined_data6, "Question3/Temp/6)Ratings_Categorised.csv", row.names = FALSE)

# Count the number of products in each rating category
rating_counts <- combined_data6 %>%
  group_by(ratings) %>%
  summarise(count = n())

# Print the results
print("Number of products in each rating category:")
print(rating_counts)

# Check for the number of null (NA or empty) values in each column
null_count <- sapply(combined_data6, function(x) sum(is.na(x) | x == "" | x == "NA"))
print(null_count)