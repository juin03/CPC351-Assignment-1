library(data.table)

data <- fread("Question3/Amazon_Products_Corrected.csv")

categorize_ratings <- function(data) {
  # Filter ratings to include only values in the range of 0.0 to 5.0
  data <- data[data$ratings >= 0.0 & data$ratings <= 5.0, ]

  # Clean the 'ratings' column as needed (assuming it's numeric)
  data$ratings <- as.numeric(data$ratings)

  # Categorize ratings
  data$rating_category <- cut(data$ratings,
    breaks = c(-Inf, 1.0, 1.5, 3.0, Inf),
    labels = c("Low", "Medium", "Medium", "High"),
    right = FALSE
  )

  return(data)
}

# Apply the function to the data
data <- categorize_ratings(data)

str(data)