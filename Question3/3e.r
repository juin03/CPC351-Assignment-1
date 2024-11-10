source("Question3/3d.r")

library(dplyr)

summary <- data %>%
  group_by(manufacturer) %>%
  summarize(max_discount = max(discount_percentage, na.rm = TRUE)) %>%
  arrange(desc(max_discount))

print(summary)

fwrite(summary, "Question3/temo/test.csv", row.names = FALSE)
