library(data.table)

data <- fread("Question3/temo/Amazon_Products_Corrected.csv")

str(data)

data <- data[
  !is.na(data$actual_price),
]

data$discount_price[is.na(data$discount_price)] <-
  data$actual_price[is.na(data$discount_price)]

head(data)

if (any(data$actual_price < data$discount_price)) {
  warning("There are products with actual_price less than discount_price")
}

data$discount_percentage <-
  (data$actual_price - data$discount_price) / data$actual_price * 100

str(data)

nrow(data)

fwrite(data, "Question3/temo/Amazon_Products_With_Discount.csv")
