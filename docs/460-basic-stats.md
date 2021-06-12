## Applying basic stats



Following up on our analysis using visualizations, we will review different types of statistical tests that we can perform on data. We will again revisit the mammalian sleep dataset `msleep`.


```r
head(msleep)
```

```
## # A tibble: 6 x 11
##   name    genus vore  order conservation sleep_total sleep_rem sleep_cycle awake
##   <chr>   <chr> <chr> <chr> <chr>              <dbl>     <dbl>       <dbl> <dbl>
## 1 Cheetah Acin… carni Carn… lc                  12.1      NA        NA      11.9
## 2 Owl mo… Aotus omni  Prim… <NA>                17         1.8      NA       7  
## 3 Mounta… Aplo… herbi Rode… nt                  14.4       2.4      NA       9.6
## 4 Greate… Blar… omni  Sori… lc                  14.9       2.3       0.133   9.1
## 5 Cow     Bos   herbi Arti… domesticated         4         0.7       0.667  20  
## 6 Three-… Brad… herbi Pilo… <NA>                14.4       2.2       0.767   9.6
## # … with 2 more variables: brainwt <dbl>, bodywt <dbl>
```

------

### Describing quantitative variables

There are several ways to describe quantitative measurements. We might first look at the range of values using the `quantile` function, which returns the min, max, and median values as well as the 25th and 75th percentiles.  


```r
quantile(msleep$brainwt, na.rm = TRUE)
```

```
##      0%     25%     50%     75%    100% 
## 0.00014 0.00290 0.01240 0.12550 5.71200
```

Note that we are using the setting `na.rm = TRUE` as an argument to these functions so that it ignores `NA` values in the data.

You can also directly isolate some of these values using the functions `min` or `max`. We might describe the center of our data, that is the mean or the median values using those respective function names. 


```r
median(msleep$brainwt, na.rm = TRUE)
```

```
## [1] 0.0124
```

```r
mean(msleep$brainwt, na.rm = TRUE)
```

```
## [1] 0.2815814
```

We might also want to describe the spread in the data, such as the standard deviation or the interquartile range. 


```r
sd(msleep$brainwt, na.rm = TRUE)
```

```
## [1] 0.9764137
```

```r
IQR(msleep$brainwt, na.rm = TRUE)
```

```
## [1] 0.1226
```

Visualizations are a great way to see this information in one picture. We have learned to create a fancier histogram, but the `hist` function always works for quick viewing (worksheet tasks 3.6.1A and 3.6.1B).


```r
hist(msleep$brainwt)
```

<img src="460-basic-stats_files/figure-html/stats5-1.png" width="672" />

It is clear from this image that the data is skewed towards approaching 0 with a few high outliers. 

------

### Finding differences in data

For the following statistical tests, we want to determine if measurements of a quantitative variable taken on a certain group of samples are different from similar measurements taken from a different group of samples.

To know if these differences are **statistically significant**, we need to be aware of the uncertainty in our data. Even if we have collect many observations, there is generally noisiness and error in those measurements. Thus, we have uncertainty if the mean value we calculate for a group is in fact the true mean.

We can calculate a confidence interval to describe our guess for the mean in our data. That is, we can identify the mean based on our samples, but also provide an upper or lower bound for where the mean might be (worksheet task 3.6.2A).


```r
t.test(msleep$brainwt)
```

```
## 
## 	One Sample t-test
## 
## data:  msleep$brainwt
## t = 2.1581, df = 55, p-value = 0.03531
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  0.02009613 0.54306673
## sample estimates:
## mean of x 
## 0.2815814
```

We use this `t.test` function because we assume that our data is normally distributed (which is not necessarily always the case) and it has a small sample size. You can see that while the mean for brain weight from this popular is 0.28, the range is fairly large (between 0.2 and 0.54) because of how big the variability is in the data.

If we want to determine if two populations have a difference in their mean values that is statistically significant, we can calculate the t-test between two sets of observations. Let's look at whether the average time spent awake by mammals who are insectivores is significantly less than those who are not (worksheet task 3.6.2B).


```r
insectivores <- msleep %>% 
  filter(vore == "insecti") %>%
  select(awake)

other.mammals <- msleep %>% 
  filter(vore != "insecti") %>%
  select(awake)

head(insectivores)
```

```
## # A tibble: 5 x 1
##   awake
##   <dbl>
## 1   4.3
## 2   4.1
## 3   5.9
## 4  15.6
## 5  15.4
```

```r
head(other.mammals)
```

```
## # A tibble: 6 x 1
##   awake
##   <dbl>
## 1  11.9
## 2   7  
## 3   9.6
## 4   9.1
## 5  20  
## 6   9.6
```

At first, we use tidyverse functions to isolate only the mammals that match the feeding behavior and select only the relevant column, before feeding this data into the `t.test` function (worksheet tasks 3.6.2C and 3.6.2D).


```r
t.test(insectivores, other.mammals, alternative = "less")
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  insectivores and other.mammals
## t = -1.7796, df = 4.3091, p-value = 0.0723
## alternative hypothesis: true difference in means is less than 0
## 95 percent confidence interval:
##       -Inf 0.8336811
## sample estimates:
## mean of x mean of y 
##   9.06000  13.86056
```

These results show a p-value of 0.07, which is not the usual level of significance that most scientists accept (p-value < 0.05).

However, there are numerous feeding behaviors besides insectivore and we may be interested in comparing the multiple categories against each other. We can use ANOVA (analysis of variance) to see how our quantitative variable is affected by the different kinds of feeding behavior (worksheet tasks 3.6.2E and 3.6.2F).


```r
anova.msleep <- aov(awake ~ vore, data = msleep)
summary(anova.msleep)
```

```
##             Df Sum Sq Mean Sq F value Pr(>F)  
## vore         3  133.7   44.58   2.234 0.0916 .
## Residuals   72 1437.0   19.96                 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 7 observations deleted due to missingness
```

The p-value of 0.09 suggests that there may not be a strongly significant difference in the average time spent awake between these groups.

------

### Identifying correlations

When we are examining the relationship between two quantitative variables, we might be interested in whether they correlate with one another. A positive correlation between x and y means that as x increases so does y. A negative correlation between x and y means that as x increases, y decreases. We can use the base R `cor` function to calculate the correlation between two numeric vectors.


```r
cor(msleep$brainwt, msleep$bodywt)
```

```
## [1] NA
```

Notice that we get `NA` instead of an actual numeric value. Unfortunately there is not an easy setting to have the `cor` function ignore any `NA` values. Thus, we need to temporarily remove these values. Let's first find them with the `summary` function.


```r
summary(msleep$bodywt)
```

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##    0.005    0.174    1.670  166.136   41.750 6654.000
```

```r
summary(msleep$brainwt)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
## 0.00014 0.00290 0.01240 0.28158 0.12550 5.71200      27
```

There are no `NA` values in the `bodywt` column, but there are 27 `NA` values in the `brainwt` column. Let's remove those using a helpful function in tidyverse and save the more complete dataset as `msleep2` (worksheet task 3.6.3A).


```r
msleep2 <- msleep %>% drop_na(brainwt)
dim(msleep)
```

```
## [1] 83 11
```

```r
dim(msleep2)
```

```
## [1] 56 11
```

You can see that we dropped 27 rows, corresponding to the mammals for whom brain weight was not measured or available. Now we can try to use the `cor` function.


```r
cor(msleep2$brainwt, msleep2$bodywt)
```

```
## [1] 0.9337822
```

We can see that the correlation is 0.93, a value very close to 1. This suggests that these variabilities are almost perfectly correlated with each other, which we saw when we plotted these two variables against each other in the prior section.

There are multiple types of correlations. The `cor` function uses a Pearson correlation by default and can use different methods like Spearman. Let's explore the difference between these correlations by looking at the relationship between the log value of brain weight and length of sleep cycle.


```r
msleep3 <- msleep %>% 
  mutate(brainwt_log = log(brainwt)) %>% 
  drop_na(brainwt_log, sleep_cycle)
ggplot(msleep3, aes(x = brainwt_log, y = sleep_cycle)) + 
  geom_point() + geom_smooth(method = "lm")
```

```
## `geom_smooth()` using formula 'y ~ x'
```

<img src="460-basic-stats_files/figure-html/stats13a-1.png" width="672" />

When we plot these variables against each other, including a fitted linear trend line, we can see that there is a relationship between these variables (worksheet task 3.6.3B). However, the points do not quite fit a straight line if we look at the edges and center of this fitted line. This will reflect in our calculation of two different correlations (worksheet task 3.6.3C).


```r
cor(msleep3$brainwt_log, msleep3$sleep_cycle, method = "pearson")
```

```
## [1] 0.8331014
```

```r
cor(msleep3$brainwt_log, msleep3$sleep_cycle, method = "spearman")
```

```
## [1] 0.8726893
```

Pearson correlations are higher when the data fits to a straight line like a trend line. However, Spearman correlations do not require a single slope: as long as one value goes up and the other goes up, these values are considered highly correlated.

------

### Producing linear models

You may be interested in studying the relationship between one or more variables and some outcome that you care about. To determine if this set of one or more variables are strong predictors of an outcome (some quantitative variable), you can fit a linear model to this data using the `lm` function.

Here we train a linear model to try to predict brain weight from body weight in the `msleep` dataset.

Linear models are established with a formula with the format of `outcome ~ predictor` where we are trying to determine if the predictor is able to help us accurately estimate an outcome (worksheet task 3.6.4A).


```r
my.mod <- lm(formula = brainwt ~ bodywt, data = msleep2)
summary(my.mod)
```

```
## 
## Call:
## lm(formula = brainwt ~ bodywt, data = msleep2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.78804 -0.08422 -0.07634 -0.02839  2.06190 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 8.592e-02  4.821e-02   1.782   0.0804 .  
## bodywt      9.639e-04  5.027e-05  19.176   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.3526 on 54 degrees of freedom
## Multiple R-squared:  0.8719,	Adjusted R-squared:  0.8696 
## F-statistic: 367.7 on 1 and 54 DF,  p-value: < 2.2e-16
```

In the summary of the results of this modeling, we see that `bodywt` is a significant predictor of `brainwt` in the `msleep` dataset. We can provide more predictors into our formula in the format: `outcome ~ predictor1 + predictor2 + ...` (worksheet tasks 3.6.4B and 3.6.4C).


```r
my.mod2 <- lm(formula = sleep_total ~ bodywt + brainwt, data = msleep2)
summary(my.mod2)
```

```
## 
## Call:
## lm(formula = sleep_total ~ bodywt + brainwt, data = msleep2)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -7.4531 -2.2517 -0.2619  2.0531  9.2283 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 10.6722485  0.5898643  18.093   <2e-16 ***
## bodywt       0.0007953  0.0016703   0.476    0.636    
## brainwt     -2.3518943  1.6180072  -1.454    0.152    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 4.193 on 53 degrees of freedom
## Multiple R-squared:  0.1337,	Adjusted R-squared:  0.101 
## F-statistic: 4.088 on 2 and 53 DF,  p-value: 0.02232
```

These results suggest that neither `bodywt` nor `brainwt` are significant predictors of `sleep_total`. That means that the value of either of those measurements does not give us information that helps us guess the total sleep duration for a mammal accurately.

