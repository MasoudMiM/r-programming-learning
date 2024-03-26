**Data Types and Data Structures in R**

1. [Data Types](#data-types)
2. [Data Structures](#data-structures)
3. [Coercing Types](#coercing-types)
4. [Cleanup](#cleanup)

---

1. **Data Types:** <a name="data-types"></a>
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

2. **Data Structures:** <a name="data-structures"></a>
   - **Vector:** One-dimensional set of the same data type. Example:
     ```R
     v1 <- c(1, 2, 3, 4, 5)
     is.vector(v1)  # Output: TRUE
     ```
   - **Matrix:** Two-dimensional set of the same data type. Example:
     ```R
     m1 <- matrix(c(T, T, F, F, T, F), nrow = 2)
     is.matrix(m1) # Output: TRUE

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
     is.data.frame(df2) # Output: TRUE
     ```
   - **List:** A collection of objects of different types. Example:
     ```R
     o1 <- c(1, 2, 3)
     o2 <- c("a", "b", "c", "d")
     o3 <- c(T, F, T, T, F)

     list1 <- list(o1, o2, o3) # a list formed by three vectors

     list2 <- list(o1, o2, o3, list1)  # Lists within lists!
     ```

3. **Coercing Types:** <a name="coercing-types"></a>
   - Converting variables from one data type to another.

      Example - Coerce Numeric to Integer:
        ```R
        (coerce2 <- 5)
        typeof(coerce2)

        (coerce3 <- as.integer(5))
        typeof(coerce3)
        ``` 
      Example - Coerce Character to Numeric:
        ```R
        coerce4 <- c("1", "2", "3")
        typeof(coerce4)  # Output: "character"

        coerce5 <- as.numeric(c("1", "2", "3"))
        typeof(coerce5)  # Output: "double"
        ```
      Example - Coerce Matrix to Data Frame:
        ```R 
        (coerce6 <- matrix(1:9, nrow= 3))
        is.matrix(coerce6) # Output: TRUE
        
        (coerce7 <- as.data.frame(matrix(1:9, nrow= 3)))
        is.data.frame(coerce7) # Output: TRUE
        ```
4. **Cleanup:** <a name="cleanup"></a>
   - Restarting R or clearing objects from the environment can be done to clean up. Example:
     ```R
     rm(list = ls())  # Clears all objects from the workspace
     ```
   - Clearing the console can be achieved using the provided code. Example:
     ```R
     cat("\014")  # Clears the console
     ```
