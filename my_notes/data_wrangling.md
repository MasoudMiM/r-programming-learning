**Data Wrangling in R**

1. [Data Selection](#selection)
2. [Recording New Variables](#recordingvariable)
3. [Computing New Variables](#newvariable)


## 1. Data Selection <a name="selection"></a>

### 1.1 Loading Data
   - Load your dataset into R using the `read_csv` function.
   - Select the relevant columns for analysis.
   - Convert selected variables to factors for categorical analysis.
     ```R
     # Load data and select relevant variables
     df <- read_csv("Exercise Files/data/state_trends.csv") |>
       select(state, region, psych_region, data_analysis) |>
       mutate(across(c(region:psych_region), as_factor)) |>
       print()
     ```

### 1.2 Filtering by One Variable
   - Use the `filter()` function to subset data based on a single variable.
   - Example:
     ```R
     # Filtering by numeric variable
     df |>
       filter(data_analysis > 50) |>
       arrange(desc(data_analysis)) |>  # Sorts output
       print()

     # Filtering by text variable
     df |>
       filter(psych_region == "Relaxed and Creative") |>
       arrange(desc(data_analysis)) |>  # Sorts output
       print()
     ```

### 1.3 Filtering by Multiple Variables
   - Combine multiple conditions using logical operators (`|` for "or", `&` for "and", `!` for "not").
   - Example:
     ```R
     # Using "or" operator
     df |>
       filter(region == "South" |
       psych_region == "Relaxed and Creative") |>
       arrange(region, psych_region) |>  # Sorts output
       print(n = Inf)  # Print all rows

     # Using "and" operator
     df |>
       filter(region == "South" &
       psych_region == "Relaxed and Creative") |>
       print()

     # Using "not" operator
     df |>
       filter(region == "South" &
       !psych_region == "Relaxed and Creative") |>
       arrange(psych_region, desc(data_analysis)) |>
       print()
     ```

### 1.4 Key Points
   - Data selection in R involves filtering rows based on specific criteria.
   - Use logical operators to combine conditions for more complex filtering.


## 2. Recording New Variables <a name="recordingvariable"></a>

### 2.1 Loading Data
   - Load your dataset into R using the `read_csv` function.
   - Convert all character variables to factors for better handling.
   - Example:
     ```R
     # Load data and convert character variables to factors
     df <- read_csv("Exercise Files/data/state_trends.csv") |>
       mutate(across(where(is_character), as_factor)) |>
       print()
     ```

### 2.2 Recode Command
   - The `recode()` command allows combining categories or recoding values.
   - General template:
     ```R
     new_data <- df |>
       mutate(new_variable = recode(
         old_variable,
         "category_1" = "value_1",
         "category_2" = "value_2",
         .default = "default_value"
       )) |>
       select(desired_variables)
     ```
   - Example:
     ```R
     # Combine categories with recode
     df |>
       mutate(relaxed = recode(
         psych_region,
         "Relaxed and Creative" = "yes",
         "Friendly and Conventional" = "no",
         .default = "no"
       )) |>
       select(state_code, psych_region, relaxed)
     ```

### 2.3 Case_When Command
   - The `case_when()` command allows creating new variables based on conditional logic.
   - General template:
     ```R
     new_data <- df |>
       mutate(
         new_variable = case_when(
           condition_1 ~ "value_1",
           condition_2 ~ "value_2",
           TRUE ~ "default_value"
         )
       ) |>
       select(desired_variables)
     ```
   - Example:
     ```R
     # Create categories with case_when
     df |>
       mutate(
         like_arts = case_when(
           art > 75 | dance > 75 | museum > 75 ~ "yes",
           TRUE ~ "no"  # All other values
         )
       ) |>
       select(state_code, like_arts, art:museum) |>
       arrange(desc(like_arts)) |>  # Put yes at top
       print(n = Inf)               # Show all cases
     ```

### 2.4 Key Points
   - The `recode()` command is used for simple recoding of values or combining categories.
   - The `case_when()` command is useful for creating new variables based on complex conditional logic.


## 3. Computing New Variables <a name="newvariable"></a>

### 3.1 Creating Data
   - Create a dataset with tibble, a modern version of a data frame that is part of the tidyverse.
     ```R
     # Create a small dataset with 1-7 data and a missing value
     df <- tibble(
       x = 1:5, 
       y = 7:3, 
       z = c(2, 4, 3, 7, NA)
     ) |>
     print()
     ```

### 3.2 Average Across Variables
   - Use `rowMeans()` to compute the average across multiple variables.
   - Use `across()` from the tidyverse to select multiple columns.
   - Example:
     ```R
     # Average variables with rowMeans
     df |> mutate(
       mean_xy  = rowMeans(across(x:y)),
       mean_xyz = rowMeans(across(x:z)),
       mean_xz  = rowMeans(across(c(x, z)))
     )
     ```

### 3.3 Removing Missing Values
   - Use the `na.rm = TRUE` argument to remove missing values while computing averages.
   - Example:
     ```R
     # Remove missing values by adding `na.rm = TRUE`
     df |> mutate(
       mean_xy  = rowMeans(across(x:y), na.rm = TRUE),
       mean_xyz = rowMeans(across(x:z), na.rm = TRUE),
       mean_xz  = rowMeans(across(c(x, z)), na.rm = TRUE)
     )
     ```

### 3.4 Reverse Coding
   - Reverse coding is used to reverse the scale of a variable.
   - for instance sometimes 7 means "strongly agree" and 1 means "strongly
   disagree" or sometimes 1 means "strongly agree" and 7 means "strongly
   disagree". In this case, you can reverse code the variable
   so that the higher values always mean the same thing.
   - Common methods include subtracting the variable from a constant or multiplying it by -1.
   - Example:
     ```R
     # Reverse code a variable
     df |>
       mutate(y_r = 8 - y) |>  # Create reversed variable
       select(x, y_r, z) |>    # Select and reorder variables
       mutate(                 # Compute average scores
         mean_xy  = rowMeans(across(c(x, y_r)), na.rm = TRUE),
         mean_xyz = rowMeans(across(c(x, y_r, z)), na.rm = TRUE),
         mean_xz  = rowMeans(across(c(x, z)), na.rm = TRUE)
       )
     ```

#### Extra Notes on Reverse Coding:
   - For a 1-n scale, use (n + 1) - x.
     - So, for a 1-7 scale, use 8 - x.
     - For a 1-10 scale, use 11 - x.
   - For a 0-n scale, use n - x.
     - So, for a 0-5 scale, use 5 - x.
     - For a 0-10 scale, use 10 - x.
   - For a -n to +n scale, use x * -1.
     - So, for a -3 to +3 scale, use x * -1.
     - For a -10 to +10 scale, use x * -1.
     
### 3.5 psych Package
   - For more complex data manipulation tasks, consider using packages like "psych" specifically designed for this purpose.
   - Example:
     ```R
     # Install and load the psych package for data manipulation
     install.packages("psych")
     library(psych)
     ```
   - The "psych" package offers additional functions and options for data manipulation tasks.

