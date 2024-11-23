# Data Analysis Project

This repository contains R scripts for analyzing various datasets including Amazon product data and music tracks.

## Project Structure

```
├── Data/
│   ├── AmazonProducts/    # Amazon product CSV files
│   └── tracks_features.csv # Music tracks dataset
├── Question1/
│   ├── separated_csv/     # Split CSV files (Version 1)
│   ├── separated2_csv/    # Split CSV files (Version 2)
│   └── Question1.r        # File splitting implementation
├── Question2/
│   ├── 2a.r              # Revenue comparison visualization
│   ├── 2b.r              # Profitability classification
│   ├── 2c.r              # Store traffic analysis
│   └── 2d.r              # Member estimation
├── Question3/
│   ├── Temp/             # Temporary processed files
│   ├── 3a.r              # Data preprocessing
│   ├── 3b.r              # Manufacturer extraction
│   ├── 3c.r              # Data type cleaning
│   ├── 3d.r              # Discount calculation
│   ├── 3e.r              # Manufacturer analysis
│   ├── 3f.r              # Rating categorization
│   ├── 3g.r              # Price analysis
│   └── 3h.r              # Sales analysis
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