# File:     05_01_Frequencies.R
# Project:  LearningR

# LOAD PACKAGES ############################################

# RStudio will prompt you to download any packages that
# aren't already installed.

# Load packages
library(tidyverse)  # Loads the `tidyverse` collection
library(readxl)     # Reads CSV and Excel files

# LOAD DATA ################################################

# Also convert several adjacent variables to factors
df <- read_csv("Exercise Files/data/state_trends.csv") |>
  select(region:psy_reg) |> 
  mutate(across(c(psych_region, psy_reg), as_factor)) |>
  print()

# SUMMARIZE DATAFRAME ######################################

summary(df)

# SUMMARIZE CATEGORICAL VARIABLE ###########################

# "region" is a character variable

# summary() not very useful
df |> 
  select(region) |>
  summary()

# to get more clea insights about character typevariable
# it is better to use table() and it works better
df |> 
  select(region) |>
  table()

# SUMMARIZE FACTOR #########################################

# "psych_region" is a factor

# Using summary() works best
df |>
  select(psych_region) |>
  summary()

# Using table()
df |>
  select(psych_region) |>
  table()

# Convert region to a factor
df <- df |>
  mutate(region = as_factor(region)) |>
  print()

# Summarize multiple factors
summary(df)

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
