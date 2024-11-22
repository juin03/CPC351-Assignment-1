library(dplyr)
library(data.table)

# Read CSV file using relative path
combined_data5 <- fread("Question3/Temp/4)Discount_Percentage.csv")

# Group by manufacturer and calculate average discount percentage
# combined_data %>% pass the combined_data data frame to the group_by() function
# group_by(manufacturer) groups the data by the "manufacturer" column
manufacturer_discount <- combined_data5 %>%
 mutate(manufacturer = tolower(manufacturer)) %>%  # Convert all manufacturer names to lowercase
  group_by(manufacturer) %>%
  summarize(avg_discount_percentage = round(mean(discount_percentage, na.rm = TRUE), 2)) %>%
  arrange(desc(avg_discount_percentage))

# View the top 10 manufacturers with highest average discount
top_discount_manufacturers <- head(manufacturer_discount, 10)
print(top_discount_manufacturers)

# Print the total number of rows before summarising
cat("Total number of rows in combined_data5:", nrow(combined_data5), "\n")
# Print the total number of rows after summarising
cat("Total number of rows in combined_data5:", nrow(manufacturer_discount), "\n")

# Save the combined data using relative path
write.csv(manufacturer_discount, "Question3/Temp/5)Manufacturer_Summarised.csv", row.names = FALSE)

# Check for the number of null (NA or empty) values in each column
null_count <- sapply(combined_data5, function(x) sum(is.na(x) | x == "" | x == "NA"))
print(null_count)
