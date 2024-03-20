
# In R programming, piping refers to the process of using the %>%
# operator from the magrittr package (or similar operators from other packages
# like dplyr or |> from r) to chain together multiple operations in a sequence.

# This operator makes it easier to read and write code by allowing you to pass
# the output of one function directly as the input to the next function,
# creating a pipeline of operations.

# for examples:
# - function(data) --> data |> function()
# - function(data, arg) --> data |> function(arg)
# - func_3(func_2(func_1(data,a),b),c) --> data |> func_1(a) |> func_2(b) |> func_3(c)

# In R: |>
# In magrittr: %>%, %<>%, and %T>%
# - %<>% (Compound Assignment Pipe Operator): 
#   The %<>% operator is a compound assignment pipe operator.
#   It performs the operation on the left-hand side of the operator
#   and assigns the result back to the object on the left-hand side.
#   This is useful for updating variables or objects in place.
#   Example:
library(magrittr)
# Create a vector
vec <- c(1, 2, 3, 4, 5)
# Use %<>% to update the vector in place
vec %<>% 
  rep(., times = 2)
print(vec)

# - %T>% (Exposition Pipe Operator):
#   The %T>% operator is an exposition pipe operator.
#   It works similarly to %>%, but it exposes the intermediate
#   results of the pipe chain. This can be helpful for debugging
#   or understanding how data is transformed at each step of the chain.
# Example
library(magrittr)
# Create a vector
vec <- c(1, 2, 3, 4, 5)
# Use %T>% to expose intermediate results
result <- vec %T>%
  sqrt() %T>%
  log()

print(result)


# An example for using |> operator in R
library(dplyr)

# Create a sample data frame
data <- data.frame(
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, 30, 35),
  score = c(80, 75, 90)
)

# Use piping to perform operations
result <- data |>
  filter(age > 25) |>
  mutate(score_adjusted = score * 1.1) |>
  arrange(desc(score_adjusted))

print(result)

#------ In this example:
# 1. filter(age > 25) filters the data frame to include only rows
# where the age is greater than 25.

# 2. mutate(score_adjusted = score * 1.1) creates a new column score
# adjusted by multiplying the score column by 1.1.

# 3. arrange(desc(score_adjusted)) arranges the data frame
# in descending order based on the score_adjusted column.


