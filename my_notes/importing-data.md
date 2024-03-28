# Introduction to Importing Data

1. [Loading Required Packages](#loading)
2. [CSV Filess](#import-csv)
3. [Excel Files](#import-excel)
4. [JSON Files](#import-json)
---

## **1. Loading Required Packages** <a name="loading"></a>

### Overview:
In data analysis with R, importing data is a fundamental step. This process involves bringing data from external sources into your R environment for analysis and manipulation. Before importing data, you need to load the necessary packages that provide functions for reading different types of data files.

### Loading Packages:
1. **tidyverse**: The `tidyverse` collection is a powerful toolkit in R for data manipulation and visualization. It includes various packages like `ggplot2`, `dplyr`, and `readr`.
2. **readxl**: Although part of the `tidyverse`, `readxl` needs to be loaded explicitly for handling Excel files.
3. **jsonlite**: It provides functions for importing JSON data into R and converting it into R data structures such as data frames or lists.

```R
# Load packages
library(tidyverse)
library(readxl)
library(jsonlite)
```

## **2. Importing CSV Files** <a name="import-csv"></a>
CSV (Comma-Separated Values) files are commonly used for storing tabular data. In R, you can import CSV files using the readr::read_csv() function, which reads the data and stores it as a "tibble," a modern and enhanced version of a data frame.

```r
# Import CSV file
df <- read_csv("path/to/your/file.csv")
# Check data
df           # View first few rows
glimpse(df)  # Detailed view of variable names and types
```

## **3. Importing Excel Files** <a name="import-excel"></a>
Excel files (`.xls` and `.xlsx`) are also prevalent in data analysis. R provides the `readxl::read_excel()` function within the tidyverse for importing Excel files. You can then manipulate the data using various tidyverse functions.

```r
# Import Excel file
df2 <- read_excel("path/to/your/file.xlsx", sheet = "sheet_name")
# Data manipulation
df2 <- df2 %>%
  select(state_code, psych_region, extraversion:openness) %>%
  rename(y = psych_region) %>%
  mutate(y = as.factor(y)) %>%
  print()
```

NOTES:
- Use `sheet` argument to specify the sheet in Excel files.
- `select()` and `rename()` functions help in choosing and renaming columns.
- `mutate()` is useful for creating or modifying columns (e.g., converting to factors).

## **4. Importing JSON Files** <a name="import-json"></a>

JSON (JavaScript Object Notation) files are commonly used for structured data storage. R provides the `jsonlite::fromJSON()` function within the tidyverse for importing JSON files.

```r
# Import JSON file
json_data <- fromJSON("path/to/your/file.json")
# Check data
json_data
```
NOTES:
- Use `fromJSON()` function from the `jsonlite` package to import JSON files.
- JSON data can be nested, so explore the structure of the imported data using R functions like `str()` or `glimpse()`.