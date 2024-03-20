# Exploring Colors in R

1. [Introduction](#intro)
2. [Understanding Color in R](#understand)
3. [Using Colors in Plots](#use)
4. [Working with Multiple Colors](#working)
5. [Color Palettes](#palettes)
---

## 1. Introduction <a name=intro></a>

### Overview:
In data visualization, color plays a crucial role in conveying information and enhancing visual appeal. R provides various ways to work with colors, allowing users to choose from a wide range of predefined colors, create custom color palettes, and apply colors to plots and visualizations.

## 2. Understanding Color in R <a name=understand></a>

### Loading Data:
```r
# Sample data
x = c(24, 13, 7, 5, 3, 2)
barplot(x)  # Default barplot
```

### Exploring Color Options:
```r
# Get list of color names
?colors
colors()  

# Access R color swatches, names, hex codes, RGB codes, and index numbers
browseURL("https://datalab.cc/rcolors")
```

## 3. Using Colors in Plots <a name=use></a>

### Color Names
```r
# Using color names - R has 657 color names for 502 unique colors,
barplot(x, col = "red3")
barplot(x, col = "slategray3")
```

### RGB Triplets (0.00-1.00):
```r
# Using RGB triplets
barplot(x, col = rgb(.80, 0, 0))      
barplot(x, col = rgb(.62, .71, .80))  
```

### RGB Triplets (0-255):
```r
# Using RGB triplets in 0-255 range
barplot(x, col = rgb(205, 0, 0, max = 255))     
barplot(x, col = rgb(159, 182, 205, max = 255)) 
```

### RGB Hexcodes:
```r
# Using RGB hexcodes
barplot(x, col = "#CD0000")
barplot(x, col = "#9FB6CD")
```

### Index Numbers:
```r
# Using index numbers
barplot(x, col = colors()[555])
barplot(x, col = colors()[602])
```

## 4. Working with Multiple Colors <a name=working></a>

You can specify several colors in a vector, which will cycle.

### Specifying Multiple Colors:
```r
# Using multiple colors in a vector
barplot(x, col = c("red3", "slategray3"))
barplot(x, col = c("#9FB6CD", "#CD0000"))
```

## 5. Color Palettes <a name=palettes></a>

### Understanding Palettes:
```r
# Info on palettes
?palette
palette()  # See current palette
palette.pals() # returns a character vector giving the names of predefined palettes.
```

### Applying Palettes:
```r
# Using current palette
barplot(x, col = 1:6)                
barplot(x, col = rainbow(6))         
barplot(x, col = heat.colors(6))     
barplot(x, col = terrain.colors(6))  
barplot(x, col = topo.colors(6))     
barplot(x, col = cm.colors(6))       
```