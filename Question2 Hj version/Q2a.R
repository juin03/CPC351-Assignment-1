# Define the variables
companies <- c("Walmart", "Amazon")
revenue <- c(567.7, 469.8)  # Revenue in billions

# Set the output to a PNG file
png("revenue_comparison_2021.png", width = 800, height = 700)

# Plot the bar chart
barplot(
  revenue,
  names.arg = companies,
  col = c("blue", "orange"),
  main = "2021 Revenue Comparison: Walmart vs Amazon",
  xlab = "Companies",
  ylab = "Revenue (in billions USD)",
  ylim = c(0, 600)
)

# Add revenue values on top of the bars
text(x = c(1, 2), y = revenue, label = revenue, pos = 3, cex = 0.8, col = "black")

# Close the PNG device to save the image
dev.off()