## Packages - install and use

Think about sharing your code from the last few days. 
How would you share this with the other people in the course?
Can they use it easily and flexibly to handle lots of different problems?

R, like other languages, is built on a package system - if you wrap up your 
code in particular expected ways and put it in particular expected places, 
it is very easy for others to get and use your code

Packages are 
[said to be easy to make](https://ourcodingclub.github.io/tutorials/writing-r-package/),
[from scratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/).
There's more [comprehensive instruction here](https://r-pkgs.org/).
Personally, the author has never had cause to make one, but I can report that
they're very easy to use!

---

### What packages do you have already? 

You have a few. Here's a list:


```r
installed.packages()
```

But which are loaded?


```r
sessionInfo()
```

The packages are in a directory, the location is stored in this:


```r
.libPaths()
```

I'm not running that one, as it'll be different for each user. 

---


### CRAN is the canonical R package resource

The Comprehensive R Archive Netowrk 
[CRAN](https://cran.r-project.org/web/packages/)
is an integral part of the R environment.
This is a global and free resource for storing and distributing code
as R packages - well documented and designed chunks of code.

You can install packages using the RStudio IDE, but it's most important
to know how to do it in R - what's happening just under the hood.

Use `library` to load packages. 
You should be able to load a package you've
already installed. 
Call `library()` function, with an argument of the library name,
as a string.

For example:


```r
library("stringdist")
library(stringdist)
```

Don't have it? You can look for packages by using a search engine, or finding
suggestions in the documentation, papers. Once you have a package name, use


```r
install.packages("stringdist")
```

to install it. You may need to select a "mirror". This is just where you
are downloading from, usually just go with "0-Cloud"
^[I have no idea where this is, never heard of that country!].

What did this do? 
It retrieves and downloads the package's code and documentation to
what's called your library.
That's a folder on your computer where the compiled versions of the packages
are located, ready to be loaded when you want to use them.

Try it out.

Want to try it again? You can uninstall packages by removing them:


```r
remove.packages("stringdist")
```

Each package has a [page on CRAN](https://cran.r-project.org/web/packages/stringdist/index.html)
with lots more information. The reference manual is a very specific reference
document with per function level documentation.
Vingettes are write ups that are more explaining how to do things - usually.

#### ggrepel

Sometimes points are way to close, and you can't label them properly.
For example, 


```r
library(tidyverse)
```

```
## ── Attaching packages ───────────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✔ ggplot2 3.3.2     ✔ purrr   0.3.4
## ✔ tibble  3.0.4     ✔ dplyr   1.0.2
## ✔ tidyr   1.1.2     ✔ stringr 1.4.0
## ✔ readr   1.4.0     ✔ forcats 0.5.0
```

```
## ── Conflicts ──────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```r
set.seed(1234) # this is just to get the same results each time we run

read_csv("data/iris.csv",col_types='nnnncc') %>%
    slice_sample(n=20) %>%
    ggplot()+
    aes(x=Sepal.Length,y=Sepal.Width,col=Species,label=Species)+
    geom_label()+
    geom_point()
```

```
## Warning: 4 parsing failures.
## row          col expected actual            file
##  44 Sepal.Length a number    n/a 'data/iris.csv'
##  44 Sepal.Width  a number    n/a 'data/iris.csv'
## 148 Petal.Length a number    n/a 'data/iris.csv'
## 148 Petal.Width  a number    n/a 'data/iris.csv'
```

```
## Warning: Removed 1 rows containing missing values (geom_label).
```

<img src="550-packages_files/figure-html/iris_overplot_example-1.png" width="672" />

The `ggrepel` library, from CRAN, is a handy way to achieve this:


```r
library(ggrepel)

set.seed(1234) # this is just to get the same results each time we run

read_csv("data/iris.csv",col_types='nnnncc') %>%
    slice_sample(n=20) %>%
    ggplot()+
    aes(x=Sepal.Length,y=Sepal.Width,col=Species,label=Species)+
    geom_label_repel()+
    geom_point()
```

```
## Warning: 4 parsing failures.
## row          col expected actual            file
##  44 Sepal.Length a number    n/a 'data/iris.csv'
##  44 Sepal.Width  a number    n/a 'data/iris.csv'
## 148 Petal.Length a number    n/a 'data/iris.csv'
## 148 Petal.Width  a number    n/a 'data/iris.csv'
```

```
## Warning: Removed 1 rows containing missing values (geom_label_repel).
```

<img src="550-packages_files/figure-html/iris_ggrepel-1.png" width="672" />

---

### Using packages without `library()`-ing them

Some packages you don't really want to have to go through the trouble of
loading, you'll just want one function. 
For example, this website is generated with one function, `render_book()`
in the package `bookdown`. Instead of:


```r
library(bookdown)
render_book()
```

I can save a line by just using `::`


```r
bookdown::render_book()
```

This means I am looking in library `bookdown` for function `render_book`.
The function is hidden again right afterwards, but it is useful if you just
want to run one function from a library, once.

This is *super handy* when wanting to typeset (`render`) a `Rmd` file:


```r
rmarkdown::render()
```

I *never* load the `rmarkdown` package, I just type the above. A lot.
^[Or, I use the one-liner in bash of 
    `Rscript -e 'rmarkdown::render("notebook.Rmd")'` ]

---

### Github is a common place for sharing packges in development

Installing from github requires some different programming -
and there's libraries with functions for this.


```r
library("remotes")
```

This used to be part of the `devtools` package, but the authors have been
"uncoupling" these to make each package simple and composable.

#### Let's install a package off of github.

Here's a cool [Ghibli color palette](https://github.com/ewenme/ghibli),
so you can change sets of colors for your plots.
Try installing it with:


```r
remotes::install_github("ewenme/ghibli")
```

Then adapt one of your previous plots (that has colors) to use these new
color palettes.

#### Let's install another one, to check the previous

Colorblind folks can't distinguish between certain colors so well.
Designing figures so that colorblind folks can readily distinguish the
relevant differences is a *good idea*. It makes for a better figure, just
like increasing the font size and cleaning up distracting artifacts.

The `ghibli` package above has been claimed to be somewhat good for
plotting for universal visibility. Is that true?

Let's install this package to check:


```r
remotes::install_github("nowosad/colorblindcheck",upgrade="never")
```

Then


```r
library(ghibli)
library(colorblindcheck)

palette_check(ghibli_palettes$PonyoMedium,plot=T)
```

<img src="550-packages_files/figure-html/checkitout-1.png" width="672" />

```
##           name n tolerance ncp ndcp min_dist mean_dist max_dist
## 1       normal 7  9.939857  21   21 9.939857  36.11891 59.92427
## 2 deuteranopia 7  9.939857  21   19 7.044647  30.14324 52.02502
## 3   protanopia 7  9.939857  21   20 8.068943  26.94418 50.93756
## 4   tritanopia 7  9.939857  21   20 4.587519  35.34529 60.29190
```

Other packages on there:

- [Sports field plotting](https://github.com/rossdrucker/sportyR)
- [Ridgeplots in ggplot2](https://github.com/wilkelab/ggridges)
- what else?


<!-- remotes::install_github("wilkelab/ggridges" -->

---

### Bioconductor is a great place for bio-related packages

Bioconductor is a giant repository of just scientific, well bio-focused,
packages. It's where a lot of bioinformatics software gets published.
However, it has it's own package system and thus package manager.
You will have to install it ... from CRAN. Like so:


```r
install.packages("BiocManager")
```

That installs a package with a function that then installs Bioconductor
packages. It's actually easy. Let's give it a try by installing and
using the `limma` package to analyze some gene expression data.

If you're recall from before, we can use `::` to avoid having to actually
`library` the whole package:


```r
BiocManager::install()
```

And so we can use this to install important packages like `DESeq2`.


```r
BiocManager::install('DESeq2')
```

Hold off on installing this quite yet. It'd take a while.
In Bioconductor, I always say to update 'none' (press 'n' when prompted).

There's lots of good documentation on each 
[package's webpage](https://bioconductor.org/packages/release/bioc/html/DESeq2.html),
like [vingettes](https://www.bioconductor.org/packages/devel/bioc/vignettes/DESeq2/inst/doc/DESeq2.html).


### Major problems with package installations

Somethings can go wrong. You'll want to pay attention to what is output
from the installation attempt. Look for errors. Scroll up to find warnings
and errors.

These can arise from multiple ways. Here's a few ideas:

- the package name you put in is misspelled
- the package is in another repo (CRAN, Bioconductor, etc)
- your internet is down (this is more of a Stanford WiFi problem)
- your R package library directory is not writable (you don't have permission)
- the package is not available for this version of R
- the package relies on the system having programs or software or libraries
    installed that are not installed (less of a problem with RStudio)
- the package actually has a bug 

Let's next talk about how to find help for problems.

---

