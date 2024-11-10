library(dplyr)
combined_data5 <- read.csv("./Question3/Temp/4)Discount_Percentage.csv", stringsAsFactors = FALSE)

# Group by manufacturer and calculate average discount percentage
# combined_data %>% pass the combined_data data frame to the group_by() function
# group_by(manufacturer) groups the data by the "manufacturer" column
manufacturer_discount <- combined_data5 %>%
 mutate(manufacturer = tolower(manufacturer)) %>%  # Convert all manufacturer names to lowercase
  group_by(manufacturer) %>%
  summarize(avg_discount_percentage = round(mean(discount_percentage, na.rm = TRUE), 2)) %>%
  arrange(desc(avg_discount_percentage))

# View the manufacturer with the highest average discount
top_discount_manufacturer <- manufacturer_discount[1, ]

top_discount_manufacturer

# Save the combined data into a new CSV file
write.csv(manufacturer_discount, "./Question3/Temp/5)Manufacturer_Summarised.csv", row.names = FALSE)

# Check for the number of null (NA or empty) values in each column
null_count <- sapply(combined_data5, function(x) sum(is.na(x) | x == "" | x == "NA"))
print(null_count)

# Print rows where discount_percentage is null
null_discount_rows <- combined_data5 %>%
  filter(is.na(discount_percentage) | discount_percentage == "" | discount_percentage == "NA")
print(null_discount_rows)

