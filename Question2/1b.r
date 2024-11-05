# In 2021, after COVID-19 struck, online grocery shopping significantly impacted Amazon's 
# business landscape. They adapted to the changes, but over time, performance 
# fluctuated  based  on  certain  items.  Several  variables  made  it  challenging  for  them  to 
# maintain profitability in online grocery shopping. Online grocery retailers face 
# difficulties related to margins, customer price sensitivity, and delivery preferences. 
# Write an R conditional statement that evaluates a store's profitability based on these 
# three factors. Assign each factor a score and define the formula for Total score. Create 
# a profitability classification: 
# (Note: You should assign each factor a score. You may make your own assumptions) 
# • High Profitability: Total score > 25 
# • Moderate Profitability: Total score 15–25 
# • Low Profitability: Total score < 15 

margin <- 10
price_sensitivity <- 10
delivery_preferences <- 10

total_score <- margin + price_sensitivity + delivery_preferences

if(total_score > 25) {
  print("High Profitability")
} else if(total_score >= 15 && total_score <= 25) {
  print("Moderate Profitability")
} else {
  print("Low Profitability")
}

