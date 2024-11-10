data <- fread("Question3/Amazon_Products_All_Manufacturer.csv")

nrow(data)
head(data)

data$actual_price <-
  iconv(data$actual_price, from = "latin1", to = "UTF-8")
data$discount_price <-
  iconv(data$discount_price, from = "latin1", to = "UTF-8")

data$actual_price <- as.numeric(
  gsub("[^0-9.]", "", data$actual_price)
)
data$discount_price <- as.numeric(
  gsub("[^0-9.]", "", data$discount_price)
)
data$no_of_ratings <- as.integer(
  gsub("[^0-9.]", "", data$no_of_ratings)
)
data$ratings <- as.numeric(data$ratings)

head(data$no_of_ratings)

str(data)

fwrite(data, "Question3/Amazon_Products_Corrected.csv")