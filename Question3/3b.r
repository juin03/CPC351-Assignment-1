library(dplyr)

# Read CSV file
combined_data2 <- read.csv("./Question3/Temp/1)Amazon_Products_All.csv", stringsAsFactors = FALSE)

# Function to extract manufacturer name based on conditions
extract_manufacturer <- function(name) {
  # Split the name into words
  words <- unlist(strsplit(name, " "))

  # Case 1: If the first word is followed by a number, take only the first word
  if (length(words) > 1 && grepl("^[A-Za-z]+\\s?[0-9]", paste(words[1], words[2], sep = " "))) {
    return(words[1])
  }

  # Case 2: If the first word has one or two characters, take the first two words
  if (nchar(words[1]) <= 2) {
    if (length(words) > 1) {
      return(paste(words[1], words[2], sep = " "))
    } else {
      return(words[1]) # If there is only one word, return it
    }
  }

  # Default: return only the first word as the manufacturer
  return(words[1])
}

# Extract manufacturer and update the 'manufacturer' column
combined_data2$manufacturer <- sapply(combined_data2$name, extract_manufacturer)

# Move the "manufacturer" column to immediately after the "name" column
combined_data2 <- combined_data2 %>% relocate(manufacturer, .after = name)

# Save the combined data into a new CSV file
write.csv(combined_data2, "./Question3/Temp/2)Manufacturer_Extracted.csv", row.names = FALSE)
