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
     ```R
     # Summarize the entire dataframe
     summary(df) 
     ```

### 1.3 Summarizing Categorical Variable
   - For character variables, `summary()` might not be very informative.
   - Use `table()` to get a clear insight into the frequency distribution.
     ```R
     # Summarize a character variable using table()
     df |> 
       select(region) |>
       table()
     ```

### 1.4 Summarizing Factor
   - For factor variables, `summary()` works best to summarize the distribution.
   - Use `table()` for a more detailed frequency count.
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
     ```R
     # Convert region to a factor
     df <- df |>
       mutate(region = as_factor(region)) |>
       print()
     ```

### 1.6 Summarizing Multiple Factors
   - Use `summary()` to summarize multiple factors in the dataframe.
     ```R
     # Summarize multiple factors in the dataframe
     summary(df)
     ```

### 1.7 Key Points
   - Computing frequencies is essential for understanding the distribution of categorical variables.
   - Use `summary()` and `table()` functions to summarize factor and character variables respectively.
   - Convert variables to factors if necessary for better analysis.


## 2. Descriptives <a name="descriptives"></a>

### 2.2 Loading Data
   - Load your dataset into R using the `read_csv` function.
   - Convert several adjacent variables to factors for better analysis.
     ```R
     # Load data and convert adjacent variables to factors
     df <- read_csv("Exercise Files/data/state_trends.csv") |>
       mutate(across(c(region, psych_region, psy_reg, has_nba:has_any), as_factor)) |>
       print()
     ```

### 2.3 Summary
   - Use `summary()` to get an overview of the entire dataset or for a specific variable.
     ```R
     # Summary for entire dataset
     df |> summary()

     # Summary for one variable
     df |>
       select(statistics) |>
       summary()
     ```

### 2.4 Quartiles
   - Calculate Tukey's five-number summary to understand the distribution of data, including minimum, lower-hinge, median, upper-hinge, and maximum.
   - Use `fivenum()` function to compute quartiles.
     ```R
     # Tukey's five-number summary
     fivenum(df$statistics)
     ```

   - Generate boxplot stats to visualize the distribution including hinges, sample size, confidence intervals for the median, and outliers.
   - Use `boxplot()` and `boxplot.stats()` functions.
     ```R
     # Boxplot stats
     boxplot(df$statistics, notch = TRUE, horizontal = TRUE)
     boxplot.stats(df$statistics)
     ```

### 2.5 Packages
   - If you need additional options or more control over your analysis, consider using the "psych" package.
   - The "psych" package provides many more options for descriptive statistics.
     ```R
     # Install and load the psych package for advanced statistics
     install.packages("psych")
     library(psych)
     ```

### 2.6 Key Points
   - Descriptive statistics help to summarize and understand the distribution of data.
   - Quartiles provide insights into the spread and central tendency of the data.
   - Boxplots are useful for visualizing the distribution of data and identifying outliers.
   - Consider using packages like "psych" for more advanced statistical analysis.


## 3. Correlations <a name="correlation"></a>

### 3.1 Loading Data
   - Load your dataset into R using the `read_csv` function.
   - Rename variables for better readability if needed.
     ```R
     # Load data and rename variables
     df <- read_csv("Exercise Files/data/state_trends.csv") |>
       select(
         DS = data_science,
         AI = artificial_intelligence,
         ML = machine_learning,
         DA = data_analysis,
         BI = business_intelligence,
         SS = spreadsheet,
         Stats = statistics
       ) |>
       print()
     ```

### 3.2 Correlation Matrix
   - Use scatterplot matrix to visualize relationships between variables.
   - Use `cor()` function to compute the correlation matrix.
     ```R
     # Scatterplot matrix
     df |> plot()

     # Correlation matrix
     df |> cor()

     # Rounded to 2 decimals
     df |>
       cor() |>
       round(2)
     ```

### 3.3 Test and Confidence Interval for a Single Correlation
   - Use `cor.test()` to test the correlation between two variables, providing the correlation coefficient, hypothesis test results, and confidence interval.
     ```R
     # Test and CI for a single correlation
     cor.test(df$DS, df$DA)
     ```

### 3.4 Packages for P-values
   - The `Hmisc` package can provide p-values for the correlation matrix.
   - The `rstatix` package offers additional functionalities for correlation analysis, including graphical representations.
     ```R
     # Install and load packages for correlation analysis
     browseURL("https://cran.r-project.org/web/packages/Hmisc/")
     browseURL("https://cran.r-project.org/web/packages/rstatix/")
     ```

## Key Points
   - Correlation analysis helps to understand the relationship between variables.
   - Scatterplot matrix and correlation matrix are useful for visualizing and quantifying correlations.
   - Hypothesis testing can be performed to determine the significance of correlations.
   - Consider using packages like `Hmisc` or `rstatix` for more advanced correlation analysis, including p-values and graphical representations.


## 4. Linear Regression <a name="linearregression"></a>

### 4.1 Loading Data
   - Load your dataset into R using the `read_csv` function.
   - Select the variables relevant for regression analysis.
     ```R
     # Load data and select predictor and outcome variables
     df <- read_csv("Exercise Files/data/state_trends.csv") |>
       select(extraversion:hockey) |>
       print()
     ```

### 4.2 Scatterplots
   - Use scatterplots to visualize the relationship between the outcome variable and predictor variables.
   - Add regression lines to examine the linear relationship.
     ```R
     # Scatterplot of outcome and predictor variables
     df |>
       select(data_science, extraversion:openness) |>
       plot()

     # Add regression line with lm()
     lm(df$data_science ~ df$openness) |> abline()
     ```

### 4.3 Bivariate Regression
   - Compute bivariate regression models to understand the relationship between one predictor and the outcome variable.
   - Use `lm()` function to fit the regression model.
     ```R
     # Compute and save bivariate regression
     fit1 <- lm(df$data_science ~ df$openness)

     # Summarize regression model
     summary(fit1)

     # Confidence intervals for coefficients
     confint(fit1)

     # Regression diagnostics
     lm.influence(fit1)
     influence.measures(fit1)
     ```

### 4.4 Multiple Regression
   - Specify multiple regression models with one or more predictor variables.
   - Use different approaches to specify the model.
   - Example:
     ```R
     # Specify multiple regression model
     fit2 <- lm(data_science ~ ., data = df)

     # Summarize regression model
     summary(fit2)
     ```

### 4.5 Key Points
   - Regression analysis helps to understand the relationship between predictor variables and an outcome variable.
   - Bivariate regression models examine the relationship between one predictor and the outcome.
   - Multiple regression models consider the combined effect of multiple predictors on the outcome.
   - Diagnostic checks such as confidence intervals and regression diagnostics help to assess the model's validity.


## 5. Contingency Tables <a name="contingencytable"></a>

### 5.1 Loading Data
   - Load your dataset into R using the `read_csv` function.
   - Convert all variables to factors for categorical analysis.
     ```R
     # Load data and convert variables to factors
     df <- read_csv("Exercise Files/data/state_trends.csv") |>
       select(region, psy_reg) |> 
       mutate(across(everything(), as_factor)) |>
       print()
     ```

### 5.2 Analyzing Data
   - Contingency tables are used when dealing with two nominal or categorical variables.
   - Create a contingency table using the `table()` function.
     ```R
     # Create contingency table
     ct <- table(df$region, df$psy_reg)
     ct
     ```

### 5.3 Percentage Analysis
   - Calculate row percentages, column percentages, and total percentages to understand the distribution of frequencies.
   - Use `prop.table()` function to compute percentages.
     ```R
     # Row percentages
     ct |>
       prop.table(1) |>  
       round(2) * 100

     # Column percentages
     ct |>
       prop.table(2) |>  
       round(2) * 100

     # Total percentages
     ct |>
       prop.table() |>  
       round(2) * 100
     ```

### 5.4 Chi-squared Test
   - Perform a chi-squared test to assess the independence of variables.
   - Extract additional information such as observed and expected frequencies, residuals, and standardized residuals.
     ```R
     # Perform chi-squared test
     tchi <- chisq.test(ct)
     tchi

     # Additional tables
     tchi$observed    # Observed frequencies
     tchi$expected    # Expected frequencies
     tchi$residuals   # Pearson's residuals
     tchi$stdres      # Standardized residuals
     ```
### 5.5 Key Points
   - Contingency tables provide a useful way to summarize the relationship between categorical variables.
   - Percentage analysis helps in understanding the distribution of frequencies across categories.
   - Chi-squared tests are used to assess the independence of categorical variables, with additional metrics available to understand the deviation from expected values.



