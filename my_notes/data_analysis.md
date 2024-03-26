**Data Analysis in R**

1. [Computing Frequencies](#frequencies)
2. [Descriptives](#descriptives)
3. [Correlations](#correlation)
4. [Linear Regression](#linearregression)
5. [Contingency Tables](#contingencytable)


## 1. Computing Frequencies <a name="frequencies"></a>

### 1.1 Loading Data
   - Load your dataset into R using the `read_csv` function.
   - Convert several adjacent variables to factors for categorical analysis.
     ```R
     # Load data and convert adjacent variables to factors
     df <- read_csv("Exercise Files/data/state_trends.csv") |>
       select(region:psy_reg) |> 
       mutate(across(c(psych_region, psy_reg), as_factor)) |>
       print()
     ```

### 1.2 Summarizing Dataframe
   - Use `summary()` to get an overview of the dataframe.
   - Example:
     ```R
     # Summarize the entire dataframe
     summary(df) 
     ```

### 1.3 Summarizing Categorical Variable
   - For character variables, `summary()` might not be very informative.
   - Use `table()` to get a clear insight into the frequency distribution.
   - Example:
     ```R
     # Summarize a character variable using table()
     df |> 
       select(region) |>
       table()
     ```

### 1.4 Summarizing Factor
   - For factor variables, `summary()` works best to summarize the distribution.
   - Use `table()` for a more detailed frequency count.
   - Example:
     ```R
     # Summarize a factor variable using summary()
     df |>
       select(psych_region) |>
       summary()

     # Summarize a factor variable using table()
     df |>
       select(psych_region) |>
       table()
     ```

### 1.5 Converting Variables to Factors
   - Use `as_factor()` to convert a variable to a factor if needed.
   - Example:
     ```R
     # Convert region to a factor
     df <- df |>
       mutate(region = as_factor(region)) |>
       print()
     ```

### 1.6 Summarizing Multiple Factors
   - Use `summary()` to summarize multiple factors in the dataframe.
   - Example:
     ```R
     # Summarize multiple factors in the dataframe
     summary(df)
     ```

### 1.7 Key Points
   - Computing frequencies is essential for understanding the distribution of categorical variables.
   - Use `summary()` and `table()` functions to summarize factor and character variables respectively.
   - Convert variables to factors if necessary for better analysis.



## 2. Descriptives <a name="descriptives"></a>


## 3. Correlations <a name="correlation"></a>


## 4. Linear Regression <a name="linearregression"></a>


## 5. Contingency Tables <a name="contingencytable"></a>


