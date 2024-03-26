# File:     04_03_NewVariables.R
# Project:  LearningR

# LOAD PACKAGES ############################################

# RStudio will prompt you to download any packages that
# aren't already installed.

library(tidyverse)

# CREATE DATA ##############################################

# Create a small dataset with 1-7 data and a missing value
# tibble is a modern version of a data frame that is part of 
# the tidyverse. It is a data frame with some additional 
# features that make it easier to work with.

df <- tibble(
  x = 1:5, 
  y = 7:3, 
  z = c(2, 4, 3, 7, NA)
) |>
print()

# AVERAGE ACROSS VARIABLES #################################

# Average variables with `rowMeans`
# across is a tidyverse function that allows you to select
# multiple columns at once. It is used with rowMeans to
# compute the average of multiple columns.

df |> mutate(
  mean_xy  = rowMeans(across(x:y)),
  mean_xyz = rowMeans(across(x:z)),
  mean_xz  = rowMeans(across(c(x, z)))
)

# Remove missing values by adding `na.rm = T`
df |> mutate(
  mean_xy  = rowMeans(across(x:y), na.rm = T),
  mean_xyz = rowMeans(across(x:z), na.rm = T),
  mean_xz  = rowMeans(across(c(x, z)), na.rm = T)
)

# REVERSE CODING ###########################################
# sometimes you need to reverse code a variable, for instance
# sometimes 7 means "strongly agree" and 1 means "strongly disagree"
# or sometimes 1 means "strongly agree" and 7 means "strongly
# disagree". In this case, you can reverse code the variable
# so that the higher values always mean the same thing.

df |>
  mutate(y_r = 8 - y) |>  # Create reversed variable
  select(x, y_r, z) |>    # Select and reorder variables
  mutate(                 # Compute average scores
    mean_xy  = rowMeans(across(c(x, y_r)), na.rm = T),
    mean_xyz = rowMeans(across(c(x, y_r, z)), na.rm = T),
    mean_xz  = rowMeans(across(c(x, z)), na.rm = T)
  )

# this is a very common approach in social science research.
# here are some common ways to reverse code variables:
# For a 1-n scale, use (n + 1) - x
# So, for a 1-7 scale, use 8 - x
# So, for a 1-10 scale, use 11 - x
#
# For a 0-n scale, use n - x
# So, for a 0-5 scale, use 5 - x
# So, for a 0-10 scale, use 10 - x
#
# For a -n to +n scale, use x * -1
# So, for a -3 to +3 scale, use x * -1
# So, for a -10 to +10 scale, use x * -1

# PACKAGES #################################################
# If you need to do a lot of data manipulation, you may
# want to consider using a package that is specifically
# designed for this purpose.
# The "psych" package can make this process much easier and
# has many more options
browseURL("https://CRAN.R-project.org/package=psych")

# CLEAN UP #################################################

# Clear R 
#   Restart R to clear objects from the environment, clear
#   plots, unload external packages, reset options, relative
#   paths, dependencies, etc. Use the RStudio menu Session > 
#   Restart R, or use Ctrl+Shift+F10 (for Windows and Linux)
#   or Command+Shift+0 (for MacOS).

# Clear console
cat("\014")  # Mimics ctrl+L

# Clear mind :)
