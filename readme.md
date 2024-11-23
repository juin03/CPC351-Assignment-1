# CPC351: Principle of Data Analytics Assignment 1
## Team Members

- Lim Ting Juin (163634)
- Lai Yicheng (163729)
- Koay Chun Keat (164592)
- Teh Hong Jun (164723)

This repository contains R scripts for the assignment 1 of CPC351: Principle of Data Analytics.

## Project Structure

```
├── Data/
│   ├── AmazonProducts/    # Amazon product CSV files
│   └── tracks_features.csv # Music tracks dataset - added manually
├── Question1/
│   ├── separated_csv/     # Split CSV files (Version 1) - generated after Question 1.r
│   ├── separated2_csv/    # Split CSV files (Version 2) - generated after Question 1.r
│   └── Question1.r        # File splitting implementation
├── Question2/
│   ├── 2a.r              # Revenue comparison visualization
│   ├── 2b.r              # Profitability classification
│   ├── 2c.r              # Store traffic analysis
│   └── 2d.r              # Member estimation
├── Question3/
│   ├── Temp/             # Temporary processed files
│   ├── 3a.r              # Combining Datasets from 108 CSV files
│   ├── 3b.r              # Extract Manufacturing information
│   ├── 3c.r              # Data Type Correction
│   ├── 3d.r              # Calculate Discount Percentage
│   ├── 3e.r              # Manufacturer with Highest Discount
│   ├── 3f.r              # Ratings Categorisation
│   ├── 3g.r              # Top and Lowest Pricing & Discount-Rating Analysis
│   └── 3h.r              # Top Sales Product
```

## Important Note

⚠️ Before running the scripts, ensure you have:

1. Added `tracks_features.csv` to the `Data` folder
2. Added all 108 Amazon product CSV files to `Data/AmazonProducts` folder
3. Modified the working directory in the following files:
   - Question1.r (Line 9)
   - 2a.r (Line 5)
   - 3a.r (Line 6)

Change the `setwd()` command to match your local project path:

```r
setwd("YOUR_PROJECT_PATH")
```

## Requirements

- R (version 4.0.0 or higher)
- Required packages:
  - dplyr
  - data.table
  - ggplot2

Install packages using:

```r
install.packages(c("dplyr", "data.table", "ggplot2"))
```

## Running the Scripts

1. Update the working directory as mentioned above
2. Run scripts in numerical order within each Question folder
3. For Question 3, run scripts alphabetically (3a.r → 3b.r → etc.)