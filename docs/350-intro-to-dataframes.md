## Working with dataframes

We can now work our way from vectors to dataframes. The most common data format we will deal with in research is a dataframe format.

A dataframe has data is stored in a tabular format with the rows generally referring to individual measurements (single patients, samples, cells, etc.) and the columns referring to parameters (genes, proteins, etc.) measured in each individual. Essentially a dataframe can be thought of a bunch of vectors lined up in columns or lined up in rows.

We work with a dataframe instead of a matrix (another datatype in R) because dataframes can tolerate different datatypes in the same table. As seen below, a matrix will easily accept data all of the same datatype, but do unexpected things when you provide multiple datatypes.


```r
matrix1 <- matrix(data = c(1, 2, 3, 4, 5, 6, 7, 8, 9),
                    nrow = 3, ncol = 3)
matrix1
```

```
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9
```

```r
matrix2 <- matrix(data = c(1, "apple", 3, TRUE, "cat", 6, 7, NA, FALSE),
                    nrow = 3, ncol = 3)
matrix2
```

```
##      [,1]    [,2]   [,3]   
## [1,] "1"     "TRUE" "7"    
## [2,] "apple" "cat"  NA     
## [3,] "3"     "6"    "FALSE"
```

Now `matrix1` looks normal, but you may notice that `matrix2` has quotation marks around its elements, including the numbers and the `TRUE`/`FALSE` values. This means these elements are all being treated like character strings because we included elements like `apple` and R wants them to be one consistent type.

While we are working mainly with dataframes, tibbles will pop up as we work in *tidyverse*. Tibbles are very similar to dataframes in their ability to handle different data types across their different columns. You can think of them as very similar entities.

We will first explore the built-in `iris` dataset. If you look up its documentation, you will notice that it is described as a dataframe and does contain both numeric values and character strings for the names of species.


```r
?iris
```

For the sake of this exercise, we will assign a new variable called `iris.temp` that is a shorter version of the original dataset. The `head` function returns just the first few rows and here we use an argument to request the first 10.


```r
iris.temp <- head(iris, n = 10)
iris.temp
```

```
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1           5.1         3.5          1.4         0.2  setosa
## 2           4.9         3.0          1.4         0.2  setosa
## 3           4.7         3.2          1.3         0.2  setosa
## 4           4.6         3.1          1.5         0.2  setosa
## 5           5.0         3.6          1.4         0.2  setosa
## 6           5.4         3.9          1.7         0.4  setosa
## 7           4.6         3.4          1.4         0.3  setosa
## 8           5.0         3.4          1.5         0.2  setosa
## 9           4.4         2.9          1.4         0.2  setosa
## 10          4.9         3.1          1.5         0.1  setosa
```

### Indexing and subsetting dataframes

You can index into a dataframe and pull out one or more cells within the dataframe. Note that we are providing two coordinates to explain which row (the first number before the comma) and which column (the second number after the comma) to find the exact element (or cell in the table).


```r
iris.temp[1, 3]
```

```
## [1] 1.4
```

You can pull out multiple elements at a time, specifying which row and column they reside in.


```r
iris.temp[c(1, 2), c(2, 3)] # gives us the 2nd and 3rd columns of the 1st and 2nd rows
```

```
##   Sepal.Width Petal.Length
## 1         3.5          1.4
## 2         3.0          1.4
```

```r
iris.temp[1:3, 3:5] # gives us the 3rd through 5th columns of the 1st through 3rd rows
```

```
##   Petal.Length Petal.Width Species
## 1          1.4         0.2  setosa
## 2          1.4         0.2  setosa
## 3          1.3         0.2  setosa
```

If you provide the row and not the column, or vice versa, by default R will pull out all of the available columns and rows respectively.


```r
iris.temp[1:2, ] # pulls out the first two rows and all columns
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
```

```r
iris.temp[, 1:2] # pulls out the first two columns and all rows
```

```
##    Sepal.Length Sepal.Width
## 1           5.1         3.5
## 2           4.9         3.0
## 3           4.7         3.2
## 4           4.6         3.1
## 5           5.0         3.6
## 6           5.4         3.9
## 7           4.6         3.4
## 8           5.0         3.4
## 9           4.4         2.9
## 10          4.9         3.1
```

It's possible to also remove elements in a dataframe using the negative sign.


```r
iris.temp2 <- iris.temp[-c(1, 3), ] # removes the first and third rows
head(iris.temp)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```

```r
head(iris.temp2)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 2          4.9         3.0          1.4         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
## 7          4.6         3.4          1.4         0.3  setosa
## 8          5.0         3.4          1.5         0.2  setosa
```

We saved the shorter dataset into a new variable and when we preview `iris.temp` against `iris.temp2` you may be able to see the missing rows.

### Exploring dataframes

When you are first presented with a dataframe, for example data that was collected in your research lab that you are tasked with analyzing, you will want to learn more about it. There are a few different functions you can use to investigate a dataframe, the size of it, and other aspects.

The `dim` function, short for dimensions, returns the number of rows and columns.


```r
dim(iris)
```

```
## [1] 150   5
```

```r
dim(iris.temp)
```

```
## [1] 10  5
```

This shows you that `iris.temp` is in fact just the first 10 rows of `iris`. You can use the following functions: `str` for structure, `colnames` for column names, and `summary` to investigate aspects of a given dataset.


```r
colnames(iris)
```

```
## [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
```

```r
str(iris)
```

```
## 'data.frame':	150 obs. of  5 variables:
##  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
##  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
##  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
##  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

```r
summary(iris)
```

```
##   Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
##  Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
##  1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
##  Median :5.800   Median :3.000   Median :4.350   Median :1.300  
##  Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
##  3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
##  Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
##        Species  
##  setosa    :50  
##  versicolor:50  
##  virginica :50  
##                 
##                 
## 
```

The `str` function reveals that the `iris` dataframe contains different data types. Specifcally, it mostly contains columns of numbers as well as a column of factors or categorical data referring to which species the iris belonged to.

The `summary` function tries to tell us more info about each column. For numerical data, it summarizes the min and max values, the quartiles, and the center values (e.g. median or mean). For categorical data like the `Species` column, this function shows how many rows belong to each category.

We can try to look at the beginning of a specific column in this dataset to get a better understanding for it. Dataframes that have names for their columns allow you to index into the columns specifically by name using the `$` operator as shown below.


```r
head(iris$Species)
```

```
## [1] setosa setosa setosa setosa setosa setosa
## Levels: setosa versicolor virginica
```

Remember the `head` function lets us preview a longer set of data, either showing the first few elements of a vector or the first few rows of a dataframe.

### Building and modifying dataframes

We can also generate our own dataframes from vectors that we put together into a table. Revisiting our heart rate measurement example, let's build a dataframe of patient data.


```r
patient.data <- data.frame(name = c("oakley", "rashmi", "kiran"),
                           heart_rate = c(78, 68, 95),
                           disease_status = c(FALSE, FALSE, TRUE))
patient.data
```

```
##     name heart_rate disease_status
## 1 oakley         78          FALSE
## 2 rashmi         68          FALSE
## 3  kiran         95           TRUE
```

We can inspect the dataframe we have created using the same functions.


```r
str(patient.data)
```

```
## 'data.frame':	3 obs. of  3 variables:
##  $ name          : Factor w/ 3 levels "kiran","oakley",..: 2 3 1
##  $ heart_rate    : num  78 68 95
##  $ disease_status: logi  FALSE FALSE TRUE
```

```r
summary(patient.data)
```

```
##      name     heart_rate    disease_status 
##  kiran :1   Min.   :68.00   Mode :logical  
##  oakley:1   1st Qu.:73.00   FALSE:2        
##  rashmi:1   Median :78.00   TRUE :1        
##             Mean   :80.33                  
##             3rd Qu.:86.50                  
##             Max.   :95.00
```

You can add new rows and columns using the `rbind` and `cbind` functions. Let's pretend that we had collected additional information about our patients, such as their self-reported gender. We can add this as a new column (`cbind` short for bind column).


```r
patient.data <- cbind(patient.data, gender = c("M", "F", NA))
patient.data
```

```
##     name heart_rate disease_status gender
## 1 oakley         78          FALSE      M
## 2 rashmi         68          FALSE      F
## 3  kiran         95           TRUE   <NA>
```

You can merge two dataframes together using the `rbind` function assuming that their columns match up correctly. Let's pretend that we had another day at the clinic and collected additional patient measurements. 


```r
more.patients <- data.frame(name = c("eun", "sasha", "mattie"),
                            heart_rate = c(86, 79, 64),
                            disease_status = c(TRUE, TRUE, FALSE),
                            gender = c(NA, "M", "F"))
more.patients
```

```
##     name heart_rate disease_status gender
## 1    eun         86           TRUE   <NA>
## 2  sasha         79           TRUE      M
## 3 mattie         64          FALSE      F
```

Let's use `rbind`, short for binding rows, to add these additional rows to the bottom of our first dataframe `patient.data`.


```r
all.patients <- rbind(patient.data, more.patients)
all.patients
```

```
##     name heart_rate disease_status gender
## 1 oakley         78          FALSE      M
## 2 rashmi         68          FALSE      F
## 3  kiran         95           TRUE   <NA>
## 4    eun         86           TRUE   <NA>
## 5  sasha         79           TRUE      M
## 6 mattie         64          FALSE      F
```

You can also remove rows and columns using the trick with a negative index.


```r
patient.data[, -1] # removes first column
```

```
##   heart_rate disease_status gender
## 1         78          FALSE      M
## 2         68          FALSE      F
## 3         95           TRUE   <NA>
```

```r
patient.data[-1, ] # removes first row
```

```
##     name heart_rate disease_status gender
## 2 rashmi         68          FALSE      F
## 3  kiran         95           TRUE   <NA>
```

------

### Handling datatypes in dataframes 

One of the great strengths of a dataframe is that it can handle each column containing different datatypes. Our patient data has columns of character strings, logicals, and numerical values.

However, you should take care that sometimes unexpected behavior may arise when a column in your dataframe is one datatype and you add data that is not compatible with that datatype.

Remember that vectors can only contain one datatype at a time? Each column in the dataframe is essentially a vector.

We briefly discussed factors as categorical variables. Let's pretend that for our analysis we wanted to treat gender as a categorical variable. Factors are a special datatype that deals with categorical data and can be handy for certain manipulations or visualizations.

To do this, we can coerce data into a different datatype using functions like `as.function`.


```r
head(all.patients$gender)
```

```
## [1] M    F    <NA> <NA> M    F   
## Levels: F M
```

```r
all.patients$gender <- as.factor(all.patients$gender)
head(all.patients$gender)
```

```
## [1] M    F    <NA> <NA> M    F   
## Levels: F M
```

This vector of factors shows which category each element belongs to, and then summarizes what the possible categories are down at the bottom where it prints the `Levels` of this factor. This can cause issues if we introduce data that does not match these categories. Let's try adding a new patient's data.


```r
all.patients <- rbind(all.patients, 
                      c(name = "lupe",
                        heart_rate = 72,
                        disease_status = FALSE,
                        gender = "NB"))
```

```
## Warning in `[<-.factor`(`*tmp*`, ri, value = "lupe"): invalid factor level, NA
## generated

## Warning in `[<-.factor`(`*tmp*`, ri, value = "lupe"): invalid factor level, NA
## generated
```

```r
all.patients
```

```
##     name heart_rate disease_status gender
## 1 oakley         78          FALSE      M
## 2 rashmi         68          FALSE      F
## 3  kiran         95           TRUE   <NA>
## 4    eun         86           TRUE   <NA>
## 5  sasha         79           TRUE      M
## 6 mattie         64          FALSE      F
## 7   <NA>         72          FALSE   <NA>
```

What has happened with this new addition? If you tried to add a new patient to the dataframe that had a gender that wasn't already represented in the data, chances are you had a warning and that gender was turned to `NA`.


```r
all.patients$gender
```

```
## [1] M    F    <NA> <NA> M    F    <NA>
## Levels: F M
```

Once a factor is created, it doesn't let you easily add new categories that were not in the original set. We will not get issues though if we add a new patient whose gender is represented as one of the levels in our gender factor.


```r
all.patients <- rbind(all.patients, 
                      c(name = "chihiro", 
                        heart_rate = 101, 
                        disease_status = TRUE, 
                        gender = "M"))
```

```
## Warning in `[<-.factor`(`*tmp*`, ri, value = "chihiro"): invalid factor level,
## NA generated
```

```r
all.patients$gender
```

```
## [1] M    F    <NA> <NA> M    F    <NA> M   
## Levels: F M
```

So how do we fix this? The easiest way around this is to treat the column as characters instead of as factors.


```r
all.patients$gender <- as.character(all.patients$gender)
all.patients <- rbind(all.patients, 
                      c(name = "ayodele", 
                        heart_rate = 101, 
                        disease_status = TRUE, 
                        gender = "NB"))
```

```
## Warning in `[<-.factor`(`*tmp*`, ri, value = "ayodele"): invalid factor level,
## NA generated
```

```r
all.patients$gender
```

```
## [1] "M"  "F"  NA   NA   "M"  "F"  NA   "M"  "NB"
```

There will be times that we want to treat certain columns in our data as a factor, but take care that you add compatible data to each column of your existing dataset.
