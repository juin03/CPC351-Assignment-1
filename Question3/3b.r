source("Question3/3a.r")

data <- fread("Question3/Amazon_Products_All.csv")

str(data)

# Extract the first word from the 'name' column and store unique manufacturers
data$manufacturer <- sapply(data$name, function(x) {
  words <- unlist(strsplit(x, " "))
  words[1]
})

# Reorder the columns to place 'manufacturer' next to 'name'
setcolorder(data, c("name", "manufacturer", setdiff(names(data), c("name", "manufacturer"))))

str(data)

fwrite(data, "Question3/Amazon_Products_All_Manufacturer.csv", row.names = FALSE)
