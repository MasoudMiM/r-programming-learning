**Plots in R**

1. [Barplots](#barplots)
2. [Histograms & Density Plots](#histograms)
3. [Boxplots](#boxplots)
4. [Scatterplots](#scatterplots)
5. [Line Charts](#linecharts)
6. [Clustering Charts](#clusteringcharts)

## 1. Barplots <a name="barplots"></a>

### 1.1 Loading Packages
   - Utilize `tidyverse` collection and `readxl` for data manipulation and reading Excel files, respectively.

### 1.2 Loading Data
   - Use `read_csv` to read data and convert specified variables to factors using `mutate`.
   - Example:
     ```R
     df <- read_csv("Exercise Files/data/state_trends.csv") |>
       mutate(across(c(region:psy_reg), factor)) |>
       print()
     ```

### 1.3 Barplot of Frequencies
   - Use `barplot()` function for bar plots.
   - Initial methods involve using `plot()` or `barplot()` directly on the data column.
   - Utilize pipes (`|>`) for concise code.
   - Ensure data is in appropriate format (numeric vector) for `barplot()`.
   - Options like title, labels, orientation, and color customization can be added.
   - Example:
     ```R
     df |>
       select(psy_reg) |>
       table() |>  
       barplot(
         main   = "Personalities of 48 Contiguous US States",
         sub    = "(Source: state_trends.csv)",
         horiz  = TRUE,
         ylab   = "Personality Profile",
         xlab   = "Number of States",
         xlim   = c(0, 25),
         border = NA,
         col    = "#CD0000"  
       )
     ```

### 1.4 Stacked Barplot of Frequencies
   - Use `barplot()` with additional parameters for stacked bars.
   - Prepare data by creating a contingency table with `table()`.
   - Stacked bars can include or exclude legends.
   - Example:
     ```R
     df_t <- df |>
       select(psy_reg, region) |>
       table() |>
       print() 

     # With Legend
     df_t |> barplot(legend = rownames(df_t))

     # Without Legend
     df_t |> barplot()
     ```

### 1.5 Side-by-Side Barplot of Frequencies
   - Similar process to stacked barplots.
   - Use `beside = TRUE` parameter for side-by-side arrangement.
   - Example:
     ```R
     df_t |>
       barplot(
         legend = rownames(df_t), 
         beside = TRUE
       )
     ```

### 1.6 Key Points:
   - `barplot()` function is fundamental for creating barplots.
   - Use `table()` to prepare data for barplots, especially for stacked or side-by-side arrangements.
   - Customize plots using various parameters like title, labels, and colors.
   - Pipes (`|>`) can simplify code and enhance readability.
   - Understand the difference between simple barplots, stacked, and side-by-side barplots and when to use each.

## 2. Histograms & Density Plots <a name="histograms"></a>

### 2.1 Loading Data
   - To begin, load your data into R using the `read_csv` function from the `readr` package. This function reads comma-separated values (CSV) files.
   - Example:
     ```R
     df <- read_csv("Exercise Files/data/state_trends.csv")
     ```
   - Here, `df` is the name of the dataframe where your data is stored.

### 2.2 Histogram
   - Histograms are useful for visualizing the distribution of a continuous variable.
   - Use the `hist()` function to create a histogram.
   - Example:
     ```R
     # Default histogram
     hist(df$data_science)

     # Histogram with options
     hist(df$data_science,
       breaks = 7,  # Set the number of breaks (bins) for the histogram
       main   = "Histogram of Searches for \"Data Science\"",  # Title of the plot
       sub    = "(Source: state_trends.csv)",  # Subtitle indicating the data source
       ylab   = "Frequency",  # Label for the y-axis
       xlab   = "Searches for \"Data Science\"",  # Label for the x-axis
       border = NA,  # Remove border from bars
       col    = "#CD0000"  # Set the fill color for bars
     )
     ```
   - The `breaks` argument determines the number of bins in the histogram. It's often useful to experiment with different values to find the most informative representation.

### 2.3 Density Plot
   - Density plots estimate the probability density function of a continuous variable.
   - Use the `density()` function to calculate the density values.
   - Example:
     ```R
     # Default density plot
     plot(density(df$data_science))

     # Density plot with options
     df |>
       pull(data_science) |>
       as.numeric() |>
       density() |>
       plot(
         main = "Density Plot of Searches for \"Data Science\"",  # Title of the plot
         sub  = "(Source: state_trends.csv)",  # Subtitle indicating the data source
         ylab = "Frequency",  # Label for the y-axis
         xlab = "Searches for \"Data Science\"",  # Label for the x-axis
       )
     ```
   - In this example, `pull()` is used to extract the column `data_science` from the dataframe `df`. The column is then converted to a numeric vector using `as.numeric()` before calculating the density.

### 2.4 Filled Density Plot
   - You can enhance the density plot by adding a filled area under the curve.
   - Use the `polygon()` function to achieve this.
   - Example:
     ```R
     df |>
       pull(data_science) |>
       as.numeric() |>
       density() |>
       polygon(col  = "#CD0000")  # Fill the area under the density curve with a specific color
     ```
   - This code adds a filled density plot on top of an existing density plot. The `col` parameter specifies the fill color.

## 3. Boxplots <a name="boxplots"></a>

### 3.1 Loading Data
   - Load your dataset into R using the `read_csv` function.
   - Convert all character variables to factors for better handling.
   - Example:
     ```R
     df <- read_csv("Exercise Files/data/state_trends.csv") |>
       mutate(across(where(is_character), as_factor)) |>
       print()
     ```

### 3.2 Boxplot of Frequencies
   - Boxplots are useful for visualizing the distribution of numerical data and identifying outliers.
   - Use the `boxplot()` function to create boxplots.
   - Example:
     ```R
     # Default boxplot
     boxplot(df$dance)

     # Identify outliers
     df |>
       filter(dance > 90) |>
       select(state, dance)

     # Boxplot with options
     df |>
       select(dance) |>
       boxplot(
         horizontal = TRUE,  # Horizontal orientation
         notch      = TRUE,  # Display confidence interval for median
         main       = "Boxplot of Searches for \"Dance\"",
         sub        = "(Source: state_trends.csv)",
         xlab       = "Searches for \"Dance\"",
         col        = "#CD0000"  # Red color
       )
     ```

### 3.3 Boxplots for Multiple Variables
   - Boxplots can be created for multiple variables simultaneously.
   - Example:
     ```R
     df |>
       select(basketball:hockey) |>
       boxplot()
     ```

### 3.4 Boxplots by Group
   - Boxplots can be grouped by a categorical variable.
   - Example:
     ```R
     # Boxplots by group
     df |>
       select(has_nhl, hockey) |>
       plot()

     # Identify outliers within a group
     df |>
       filter(has_nhl == "No") |>
       filter(hockey > 80) |>
       select(state, hockey)
     
     # Boxplots by group with options
     df |>
       select(has_nhl, hockey) |>
       plot(
         horizontal = TRUE,  # Horizontal orientation
         notch      = TRUE,  # Display confidence interval for median
         main       = "Boxplot of Searches for \"Hockey\"",
         sub        = "(Source: state_trends.csv)",
         xlab       = "Searches for \"Hockey\"",
         ylab       = "State has NHL Hockey Team",
         col        = "#CD0000"  # Red color
       )
     ```

## 4. Scatterplots <a name="scatterplots"></a>

### 4.1 Loading Data
   - Load your dataset into R using the `read_csv` function.
   - Select the relevant columns for analysis.
   - Example:
     ```R
     df <- read_csv("Exercise Files/data/state_trends.csv") |>
       select(basketball:hockey) |>
       glimpse()
     ```

### 4.2 Scatterplots
   - Scatterplots are useful for visualizing the relationship between two numerical variables.
   - Use the `plot()` function to create scatterplots.
   - Example:
     ```R
     # Plot all associations
     df |> plot()

     # Bivariate scatterplot with defaults
     df |>
       select(soccer, hockey) |> 
       plot()

     # Bivariate scatterplot with options
     df |>
       select(soccer, hockey) |> 
       plot(
         main = "Scatterplot of Searches by State",
         xlab = "Searches for \"Soccer\"",
         ylab = "Searches for \"Hockey\"",
         col  = "red3",  # Color of points
         pch  = 20,      # "Plotting character" (small circle)
       )
     ```
   - The `col` parameter sets the color of the points, and `pch` specifies the plotting character. You can refer to `?pch` for a list of available plotting characters.

### 4.3 Linear Regression Line
   - You can add a fitted linear regression line to the scatterplot to visualize the trend.
   - Use the `lm()` function to fit a linear regression model, and `abline()` to plot the regression line.
   - Example:
     ```R
     # Add fit linear regression line (y ~ x)
     lm(df$hockey ~ df$soccer) |>
       abline()
     ```

## 5. Line Charts <a name="linecharts"></a>

### 5.1 Single Time Series
   - Load necessary packages, such as `datasets`, to access built-in datasets.
   - For single time series data, use appropriate functions to visualize.
   - Example with `uspop` dataset:
     ```R
     # Plot with default plot()
     plot(uspop)

     # Plot with options
     uspop |> 
       plot(
         main = "US Population 1790–1970",
         sub  = "(Source: datasets::uspop)",
         xlab = "Year",
         ylab = "Population (in millions)",
       )
     # Adding vertical lines and text
     abline(v = 1930, col = "lightgray")
     text(1930, 10, "1930", col = "red3")
     abline(v = 1940, col = "lightgray")
     text(1940, 10, "1940", col = "red3")
     ```

### 5.2 Multiple Time Series
   - For multiple time series data, utilize appropriate functions to plot.
   - Example with `EuStockMarkets` dataset:
     ```R
     # Three different plot functions
     plot(EuStockMarkets)     # Stacked windows
     plot.ts(EuStockMarkets)  # Identical to plot() - Stacked windows
     ts.plot(EuStockMarkets)  # One window

     # Plot with options
     ts.plot(
       EuStockMarkets,
       col = rainbow(4)  # Color lines
     )

     # Adding legend
     legend(
       "topleft",  # Position
       legend = colnames(EuStockMarkets),  # Names for legend
       col = rainbow(4),  # Colors for legend
       lty = 1  # Line type: solid
     )
     ```

### 5.3 Key Points
   - Understand the differences between single and multiple time series data.
   - Choose appropriate plotting functions based on the complexity of the data and desired customization options.
   - Utilize additional functions like `abline()` and `text()` to add annotations to your plots.


## 6. Clustering Charts <a name="clusteringcharts"></a>

### 6.1 Loading Data
   - Load your dataset into R using the `read_csv` function.
   - Select the relevant columns for analysis.
   - Example:
     ```R
     # Select state codes and search data
     df <- read_csv("Exercise Files/data/state_trends.csv") |>
       select(state_code, artificial_intelligence:hockey)
     ```

### 6.2 Analyzing Data
   - Cluster charts are used to visualize associations between cases rather than variables.
   - Calculate clusters using hierarchical clustering with the `hclust()` function.
   - Example:
     ```R
     # Calculate clusters using hclust()
     hc <- df |>  # Get data
       dist() |>  # Compute distance/dissimilarity matrix
       hclust()   # Compute hierarchical clusters

     # Plot dendrogram
     hc |> plot(labels = df$state_code)

     # Draw boxes around clusters
     hc |> rect.hclust(k = 2, border = "gray80")  # 2 boxes
     hc |> rect.hclust(k = 3, border = 2:4)       # 3 boxes
     # This plot uses colors 2 to 4 from the current palette
     ```

### 6.3 Key Points
   - Cluster charts provide insights into the associations between cases in your data.
   - Hierarchical clustering with dendrogram plots helps visualize the clustering structure.
   - Use `rect.hclust()` to draw boxes around clusters for better interpretation.

