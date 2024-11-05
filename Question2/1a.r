# Load the necessary library
library(ggplot2)

# Define the data for year 2021
data <- data.frame(
  Company = c("Walmart", "Amazon"), # c is short for combine
  Revenue = c(567.7, 469.8)
)

# Create a bar plot
# aes() is used for dynamic mapping
# stat = "identity" is used to plot the values directly without any transformation
plot <- ggplot(data, aes(x = Company, y = Revenue, fill = Company)) +
  geom_bar(stat = "identity", width = 0.5) +
  labs(title = "Revenue Comparison between Walmart and Amazon in 2021",
       x = "Company",
       y = "Revenue (in billions USD)") +
#   theme_minimal() +
  theme(legend.position = "none")

# Display the plot
print(plot)

# Save the plot as "1a.png" in the current working directory
ggsave(filename = "./Question2/1a.png", plot = plot, width = 8, height = 6)

