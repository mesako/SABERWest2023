## Getting started in R

Let's get started programming in R! Our goal is to be able to interact with datasets like the built-in `iris` dataset in R. By the end of today, we aim to be able to pull out information from this dataset and modify it using R programming.


```r
head(iris, n = 10)
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

------

### Getting help in R

If you run into any error while using R, it is a great idea to look up your error message in Google and read through forum posts on StackOverflow. You may find it also helps to know more about your session info such as the version of R you are using, and what packages you have currently loaded.


```r
sessionInfo()
```

```
## R version 3.6.3 (2020-02-29)
## Platform: x86_64-pc-linux-gnu (64-bit)
## Running under: Ubuntu 20.04.2 LTS
## 
## Matrix products: default
## BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.9.0
## LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.9.0
## 
## locale:
##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## loaded via a namespace (and not attached):
##  [1] compiler_3.6.3   magrittr_2.0.1   bookdown_0.22    htmltools_0.5.0 
##  [5] tools_3.6.3      yaml_2.2.1       codetools_0.2-16 stringi_1.5.3   
##  [9] rmarkdown_2.8    knitr_1.30       stringr_1.4.0    digest_0.6.27   
## [13] xfun_0.23        rlang_0.4.9      evaluate_0.14
```

You can look up what functions do using either a question mark `?` or the `help` function.


```r
?rm
help(rm)
```

You can try running the following command to look up variables that load in with base R or packages that we will use. For example, you can use the `help` function to read more details about the `iris` dataset.


```r
?iris
```

------

### Using variables and data types

Variables are a short-hand name or label that stores a piece of data. We can save information into variables and then call them by name (invoke the variable) to use that information when needed.

You can assign variables using the `=` or `<-` operators. We will use the `<-` operator exclusively going forward.


```r
save.num <- 7
save.num
```

```
## [1] 7
```

Here I have chosen the name `save.num` but you can give it a different name. Note that variable names must with a letter and cannot contain special characters.

Variables are mutable: you can overwrite the saved value of a variable with another value.


```r
save.num <- 10
save.num
```

```
## [1] 10
```

You can see that `save.num` does not remember the value 7 anymore and instead returns 10. Variables can be saved as other values such as character strings or boolean values (`TRUE` or `FALSE`). These are examples of other datatypes in R.


```r
save.string <- "hello"
save.bool <- TRUE
```

You can check what variables you have assigned in your current working environment using the `ls` function. Try running `?ls` to learn more about this function!


```r
ls()
```

```
## [1] "save.bool"   "save.num"    "save.string"
```

You can also remove saved variables using the `rm` function.


```r
rm(save.num)
ls()
```

```
## [1] "save.bool"   "save.string"
```

You will notice that our session no longer remembers `save.num`. If you tried to call `save.num` after it was removed, you would get an error message in R.

### Using functions

We have already shared several functions with you, including the `help` function, the `ls` function, and the `rm` function. Even the command `sessionInfo` is an example of a function in R!

Functions can be recognized by a string (letters) followed by parentheses `()`. Functions may take information inside the parentheses that are called arguments.


```r
?help
```

When you look at documentation for the `help` function, you will notice that there are many things you can provide inside the parentheses. The documentation section called "Arguments" describes one necessary input for `help` called `topic` that must be provided inside the parentheses.

Arguments are often named and described in the documentation. When you provide an argument to a function, you can provide it by name explicitly or just let R figure it out based on the order you give it.


```r
help(topic = iris)
help(iris)
```

In the second line, we provide only one input `iris` and R assumes that we intend for `topic = iris` as the argument.

One function we will use often is the `c` function which can be used to create a vector or ordered collection of pieces of information. 


```r
?c
```

If you look up the documentation for the `c` function, you will notice that it accepts `...` arguments. This can be confusing but it often means that it accepts multiple arguments, more than can be named or described. 

This makes sense for the `c` function because it will accept as many inputs as you give it, the number does not need to be consistent.


```r
save.data <- c(1, 4, 6, 2, 3, 8, NA)
```

Functions generally take the arguments in the parentheses as an input and then produce some output. A clear example of this is using the `mean` function.


```r
?mean
```

As implied, the `mean` function will take a grouping of numbers and return the mean or the average.


```r
mean(save.data)
```

```
## [1] NA
```

However, here we ran into an issue because one of the elements in our initial vector `save.data` is `NA`. `NA` means "not available" or in other words the data is missing. This is not the same as being zero. So R is not sure how to calculate the mean since that last element is essentially a question mark.

We can make use of an additional argument that the `mean` function takes, namely the `na.rm` argument. This argument functions more like a setting, where you can provide a flag (i.e. `TRUE` or `FALSE`) or a distinct option (e.g. `top`, `bottom`, `left`, or `right`) that modifies how it produces the output. This argument has a default that is shown in the "Usage" section of the documentation. We are going to change that setting.


```r
mean(save.data, na.rm = TRUE)
```

```
## [1] 4
```

Now you can see that R runs the function and decides to leave out or ignore the `NA` value and is able to return an average based on the other values in `save.data`.
