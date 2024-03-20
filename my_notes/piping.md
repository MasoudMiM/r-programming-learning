# Piping in R

## Introduction

In R programming, piping refers to the process of using operators like `%>%` from the magrittr package or `|>` from base R to chain together multiple operations in a sequence. This enhances code readability and allows for a more streamlined workflow by passing output directly from one function to another, creating a pipeline of operations.

## Piping Operators

### magrittr Package: `%>%`, `%<>%`, and `%T>%`

- `%>%`: Primary pipe operator used for chaining functions.
- `%<>%`: Compound Assignment Pipe Operator, updates variables or objects in place.
- `%T>%`: Exposition Pipe Operator, exposes intermediate results for debugging or understanding transformations.

#### Examples with magrittr

```r
library(magrittr)

# Example with %>%
vec <- c(1, 2, 3, 4, 5)
result <- vec %>%
  rep(., times = 2) %>%
  sqrt() %>%
  log()
print(result)

# Example with %<>% (Compound Assignment Pipe Operator)
vec <- c(1, 2, 3, 4, 5)
vec %<>%
  rep(., times = 2)
print(vec)

# Example with %T>% (Exposition Pipe Operator)
vec <- c(1, 2, 3, 4, 5)
result <- vec %T>%
  sqrt() %T>%
  log()
print(result)
```

### Base R: `|>`

The base R introduced the `|>` operator for piping operations.

| original fomat | piping format |
| -------------- | ------------- |
| Function(data) | data \|> Function() |
| Function(data, arg) | data \|> Function(arg) |
| func_3(func_2(func_1(data, a), b), c) | data \|> func_1(a) \|> func_2(b) \|> func_3(c)

#### Example with Base R

```r
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
```

Explanation of Operations:

1. `filter(age > 25)` filters the data frame to include rows where age is greater than 25.
2. `mutate(score_adjusted = score * 1.1)` creates a new column adjusting the score.
3. `arrange(desc(score_adjusted))` arranges the data frame in descending order based on the adjusted score.