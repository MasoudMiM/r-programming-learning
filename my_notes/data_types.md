**Data Types and Structures in R:**

1. **Data Types:**
   - **Numeric:** Represented by integers or decimals. Example:
     ```R
     n1 <- 15
     typeof(n1)  # Output: "double"
     ```
   - **Character:** Represents text data. Example:
     ```R
     c1 <- "c"
     typeof(c1)  # Output: "character"
     ```
   - **Logical:** Represents boolean values (TRUE or FALSE). Example:
     ```R
     l1 <- TRUE
     typeof(l1)  # Output: "logical"
     ```

2. **Data Structures:**
   - **Vector:** One-dimensional set of the same data type. Example:
     ```R
     v1 <- c(1, 2, 3, 4, 5)
     is.vector(v1)  # Output: TRUE
     ```
   - **Matrix:** Two-dimensional set of the same data type. Example:
     ```R
     m1 <- matrix(c(T, T, F, F, T, F), nrow = 2)

     ```
   - **Array:** Multi-dimensional set of the same data type. Example:
     ```R
     a1 <- array(c(1:24), c(4, 3, 2)) # Give data, then dimensions (rows, columns, tables)

     ```
   - **Data Frame:** A table-like structure where columns can be of different data types. Example:
     ```R
     vNumeric   <- c(1, 2, 3)
     vCharacter <- c("a", "b", "c")
     vLogical   <- c(T, F, T)

     df2 <- data.frame(vNumeric, vCharacter, vLogical)
     ```
   - **List:** A collection of objects of different types. Example:
     ```R
     o1 <- c(1, 2, 3)
     o2 <- c("a", "b", "c", "d")
     o3 <- c(T, F, T, T, F)

     list1 <- list(o1, o2, o3) # a list formed by three vectors

     list2 <- list(o1, o2, o3, list1)  # Lists within lists!
     ```

3. **Coercing Types:**
   - Converting variables from one data type to another. Example:
     ```R
     coerce4 <- c("1", "2", "3")
     typeof(coerce4)  # Output: "character"

     coerce5 <- as.numeric(c("1", "2", "3"))
     typeof(coerce5)  # Output: "double"
     ```
4. **Cleanup:**
   - Restarting R or clearing objects from the environment can be done to clean up. Example:
     ```R
     rm(list = ls())  # Clears all objects from the workspace
     ```
   - Clearing the console can be achieved using the provided code. Example:
     ```R
     cat("\014")  # Clears the console
     ```
