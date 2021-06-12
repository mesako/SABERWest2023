## Working with vectors

The power of using programming like R is to be able to process, analyze, and visualize large sets of data. We will build our way up to thinking about tabular data like that in the `iris` dataset starting first with vectors.

Remember that you can create vectors (an ordered list of elements) by combining elements with the `c` function.

------

### Building vectors

Let us pretend that we measured and recorded the resting heart rates of several patients. We will create these vectors and assign them to some variables (worksheet task 2.4.1A).


```r
heart.rates <- c(78, 68, 95, 82, 69, 63, 86, 74, 64, 62)
more.heart.rates <- c(86, 79, 64, 74, 80)
heart.rates
```

```
##  [1] 78 68 95 82 69 63 86 74 64 62
```

```r
more.heart.rates
```

```
## [1] 86 79 64 74 80
```

We have used the `c` function to combine several individual elements that we typed out, but you can combine vectors together to make an even bigger vector (worksheet task 2.4.1B).


```r
all.heart.rates <- c(heart.rates, more.heart.rates)
all.heart.rates
```

```
##  [1] 78 68 95 82 69 63 86 74 64 62 86 79 64 74 80
```

Vectors can contain different datatypes besides numbers. We can also provide several character strings in a vector, like the names of our patients.


```r
patient.names <- c("oakley", "rashmi", "kiran",
                   "eun", "sasha", "mattie")
```

However, note that vectors cannot handle multiple different datatypes at once. If you try to provide a vector with multiple datatypes:


```r
mixed.data <- c("oakley", 18, TRUE, "eun", NA, 50)
mixed.data
```

```
## [1] "oakley" "18"     "TRUE"   "eun"    NA       "50"
```

You can see this displays these elements enclosed in quotes, to indicate that R has converted them all to the same datatype (i.e. character string).

There are several helpful functions and an operator that can speed up your ability to generate vectors. The `:` operator quickly creates a numeric vector for a range of values.


```r
1:4
```

```
## [1] 1 2 3 4
```

The `seq` function can help you quickly create numeric vectors. The `rep` function can be used to build either numeric or character string vectors.  Reading the documentation will tell you which arguments these functions take (worksheet tasks 2.4.1C and 2.4.1D).


```r
?seq
?rep
```

Here are examples of how they can be used:


```r
z <- seq(0, 100, by = 20)
z
```

```
## [1]   0  20  40  60  80 100
```

```r
z <- rep("A", times = 5)
z
```

```
## [1] "A" "A" "A" "A" "A"
```

------

### Indexing and subsetting vectors

Indexing is a way to access into a vector (or a matrix or a data frame) and pull out certain elements.

There are multiple ways to index into a vector, one of the easiest ways is to pull out an element based on its order/position in the grouping (its index). We use `[]` immediately after the name of the grouping (in this case a vector) to access into it.


```r
all.heart.rates[2] # pull out second heart rate measurement
```

```
## [1] 68
```

```r
patient.names[3] # pull out third patient name
```

```
## [1] "kiran"
```

You can also pull out several elements at a time. To do this, you provide a vector of numeric values within the parentheses.


```r
patient.names[2:3] # pull out 2nd and 3rd patient name
```

```
## [1] "rashmi" "kiran"
```

```r
patient.names[c(1, 3)] # pull out 1st and 3rd patient name
```

```
## [1] "oakley" "kiran"
```

You can remove elements of a vector by using the same syntax of indexing, but instead put a negative sign in front of the index number (worksheet tasks 2.4.2A through 2.4.2C).


```r
patient.names[-1]
```

```
## [1] "rashmi" "kiran"  "eun"    "sasha"  "mattie"
```

There are times where we will want to pull out certain elements of a vector using something other than the position. What if we do not know where they are located, especially if the vector is very long?

------

### Using logic and logicals

You can also access elements in a vector that meet certain criteria using what we will call conditional logic. Logic will be a recurring idea in programming. Logic looks like evaluating whether something meets your criteria and evaluating it as either `TRUE` or `FALSE` (remember these words are special and represent a logical datatype).

Let's explore what it looks like to evaluate a statement.


```r
save.num <- 7
save.num < 8
```

```
## [1] TRUE
```

```r
save.num > 8
```

```
## [1] FALSE
```

```r
save.num != 8
```

```
## [1] TRUE
```

```r
save.num == 8
```

```
## [1] FALSE
```

You can use the standard comparison operators like `>` or `<` to check greater than or less than. You can also use `==` to check for equality or `!=` to check that values are not equal.

We can do the same thing with vectors, and it will be performed in a *vectorized* manner. That is, by default, R will evaluate each element in the vector to see if it meets the criteria (worksheet task 2.4.3A).

For example, we can evaluate each heart rate in our original vector to see whether or not the value is less than 80 (worksheet tasks 2.4.3B and 2.4.3C).


```r
all.heart.rates < 80
```

```
##  [1]  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE
## [13]  TRUE  TRUE FALSE
```

This series of flags with `TRUE` and `FALSE` can be used to access into a vector and will only return the elements where there is a `TRUE` (worksheet tasks 2.4.3D through 2.4.3F).


```r
all.heart.rates[all.heart.rates < 80]
```

```
##  [1] 78 68 69 63 74 64 62 79 64 74
```

In the context of bigger data analysis, we can use conditional logic to make choices between executing different sets of code. You can pair these conditional statements with an `if`/`else` statement that breaks up the code and only executes parts of the code where conditions are met.


```r
test.num <- 30

if (test.num < 10) {
  print("small")
} else {
  print("big")
}
```

```
## [1] "big"
```

Here, the code within the brackets only runs if the condition is met. Since the statement next to the `if` evaluates as `FALSE`, it then only executes the code within the brackets of the `else` clause. 

------

### Modifying vectors

Let's look into how we change an existing vector. We can save data into a vector, access this data, but we will likely want to process it too!

We can investigate an unknown vector using several functions, like the `length` function. As the name implies, it returns how many elements your vector contains.


```r
x <- c(1, 3, 2)
y <- c(5, 4, 6)
length(x)
```

```
## [1] 3
```

```r
length(y)
```

```
## [1] 3
```

Let's try modifying the values in an existing vector. Note that when you try to add values to a vector, it can be done in a pairwise manner or uniformly across the entire vector. Let's see what it looks like when we have pairwise addition of two vectors of the same length.


```r
x + y
```

```
## [1] 6 7 8
```

Here, you can see that the first element of `x` is added to the first element of `y` to create a new value in the first element. The same happens with the second element and so forth (worksheet task 2.4.4A).

You can perform mathematical operations on an entire numeric vector all at once. Here we take the vector of our heart rate data and add 1 to it, which  will add 1 to each individual element in the entire vector (worksheet tasks 2.4.4B and 2.4.4C).


```r
all.heart.rates + 1
```

```
##  [1] 79 69 96 83 70 64 87 75 65 63 87 80 65 75 81
```

This is another example of a vectorized operation, where we perform a step automatically to all items in a collection of items (e.g. a vector). This works with operators like `+` or `-`, but also with certain functions.


```r
?log
```

For example, the `log` function calculates the log value of a number. If you provide it with a vector, it will do that calculation for each element, returning a vector of the same length.


```r
log(all.heart.rates)
```

```
##  [1] 4.356709 4.219508 4.553877 4.406719 4.234107 4.143135 4.454347 4.304065
##  [9] 4.158883 4.127134 4.454347 4.369448 4.158883 4.304065 4.382027
```

This demonstrates how one can quickly transform or scale values in a dataset. For example, you might have taken the temperature of an experiment in Fahrenheit and using the power of vectorization, you can apply the same arithmetic steps to all of your measurements simultaneously to get the values in Celsius.

Here is an additional example using the `signif` function, which returns your numeric values with the number of significant digits that you specify (worksheet task 2.4.4D).


```r
?signif
```

Here we can specify one significant figure to get only the tens digit (or the hundreds digit if there is a value over 100).


```r
signif(all.heart.rates, digits = 1)
```

```
##  [1]  80  70 100  80  70  60  90  70  60  60  90  80  60  70  80
```

Any of these results can also be saved into a new vector name (e.g. `heart.rates2`) or we can save over the original variable name if we are fixing the data.
