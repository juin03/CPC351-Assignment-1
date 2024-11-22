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

⚠️ Before running the scripts, you need to modify the working directory in the following files:

1. Question1.r (Line 9)
2. 3a.r (Line 6)

Change the `setwd()` command to match your local project path:

```r
setwd("YOUR_PROJECT_PATH")
```

## Questions Overview

### Question 1
Implements file splitting and recombination with two versions:
- Basic Implementation (Version 1)
- Data Type-Safe Implementation (Version 2)

### Question 2
Contains analysis scripts for:
- Revenue comparison between Walmart and Amazon
- Profitability classification system
- Store traffic analysis
- Member number estimation

### Question 3
Series of data processing and analysis scripts for Amazon product data:
1. Data preprocessing and cleaning
2. Manufacturer extraction
3. Data type standardization
4. Discount calculations
5. Various analyses (ratings, sales, prices)

## Installation

1. Clone this repository:
```bash
git clone <repository-url>
```

2. Install R (version 4.0.0 or higher recommended)
   - Download from: https://cran.r-project.org/

## Dependencies

The project requires the following R packages:
- dplyr (>= 1.0.0)
- data.table (>= 1.14.0)
- ggplot2 (>= 3.3.0)

Install them using:

```r
install.packages(c("dplyr", "data.table", "ggplot2"))
```

## Expected Outputs

The scripts will generate:
- Separated CSV files in `Question1/separated_csv/` and `Question1/separated2_csv/`
- Visualization plots for revenue comparison
- Analysis results in the respective question folders

## Running the Scripts

1. Ensure you have R installed
2. Update the working directory as mentioned above
3. Run the scripts in numerical order within each Question folder
4. For Question 3, run scripts in alphabetical order (3a.r → 3b.r → etc.)
```

The README references the following code blocks for the working directory changes:

```8:9:Question1/Question1.r
# Set working directory
setwd("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1")
```



```5:6:Question3/3a.r
# Set working directory to your project root folder
setwd("C:/Users/User/Desktop/USM/Y3/CPC351/CPC351 Assignment 1")
```
```

## Running the Scripts

1. Ensure you have R installed
2. Update the working directory as mentioned above
3. Run the scripts in numerical order within each Question folder
4. For Question 3, run scripts in alphabetical order (3a.r → 3b.r → etc.)