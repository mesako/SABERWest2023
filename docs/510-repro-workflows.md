## What is a workflow?

What does it take to do an analysis?

When you embark on some project, it's helpful (but not necessary) to plan
where you are going. It's best to think about factors like:

- What data am I analyzing? What format is it in, and is that going to change?
    Will there be a lot more of this data that I want to process in the future?
- What kind of analyses do I want to do? What major steps do I have in my 
    process? _What work from others can I re-use and build upon?_
- What do I want to generate? What is the desired outcome, and for whom is
    this intended?

In the author's experience, bioinformatic workflows often involve reading in
big (or many) flat files, processing the data into a useful form, sometimes
using extra packages to analyze the data, then generating plots and statistical
summaries of what you found - usually in an Rmarkdown-generated report.

So let's start building up some good habits and skills!

---

### Organizing files

Everyone's got their own personal organizational systems, 
but usually everyone is operating on computers organized in a 
hierarchical file system.
This paradigm organizes files into hierarchically nesting directories.

In at least this author's experience, it is common practice to:

- use one folder per major chunk of work
- use subfolders such as
    - data
    - scripts
    - tmp
    - output
- write a README explaining what the project is and how to use it

[There](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)
[are](https://shanguangyu.com/articles/basic-folder-structure-for-bioinformatics/)
[many](https://www.thinkingondata.com/how-to-organize-data-science-projects/)
[opinions](https://drivendata.github.io/cookiecutter-data-science/#directory-structure)
[on](http://arkitus.com/patterns-for-research-in-machine-learning/)
[how](https://medium.com/human-in-a-machine-world/folder-structure-for-data-analysis-62a84949a6ce)
[to](https://www.earthdatascience.org/courses/intro-to-earth-data-science/open-reproducible-science/get-started-open-reproducible-science/best-practices-for-organizing-open-reproducible-science#3-organize-your-project-directories-to-make-it-easy-to-find-data-code-and-outputs)
[do](https://dzone.com/articles/data-science-project-folder-structure)
[this](https://data.library.arizona.edu/data-management/best-practices/data-project-organization).
The correct style is whatever works for you and your research community.

**Ask your supervisor.**

---

Here's one diagram of how this might look:

![Example from Noble PLoS 2009](img/noble2009.png)

---

### Use a notebook to generate reports

Self-documented code means code that can be understood without an external 
explanation. It is often easier to write alongside and inside the code 
than to generate a completely separate document to explain it.

Code notebooks are pretty much the 
best way^[Except in extremely limited computational environments, 
where these tools are not available or would generate too much extra 
computation per unit work.]
to go about doing this.
There are at least two approaches:

- `rmarkdown` is the premier tool for typesetting *static* notebooks
- `jupyter` is the defacto standard for *interactive* notebooks

Here, we only recommend `rmarkdown`, as it is simpler to setup, use, and
distribute results from, and is most commonly used by the R community.

---

#### Background

The `rmarkdown` package was created by
[Yihui Xie](https://www.rstudio.com/speakers/yihui-xie/),
extending from previous work and ideas in 
`knitr` and `sweave`.

It's a way of mixing writing with code, such that
you can run the code and it makes a pretty doc
(and [more](https://rmarkdown.rstudio.com/gallery.html)).

Basically, it does this:

- Parses `.Rmd` files to run the R code chunks, with appropriate chunk
    options, and saves the output of the R code along with the original
    text in a `.md` file.
- Passes the `.md` file to `pandoc` to turn this into an appropriate output,
    usually a HTML file.

`rmarkdown` is maintained by the RStudio company.
They generate 
[a lot of helpful "cheatsheets"](https://raw.githubusercontent.com/rstudio/cheatsheets/master/rmarkdown-2.0.pdf)
too.

#### Chunk options

You can set chunk-level options in an Rmd, for
each code chunk. Such as:

````
```{r, name_of_chunk, cache=T, fig.width=3, fig.height=2, error=F, warning=F, fig.align="right"}
x <- 1:10
y <- 1:10
plot(x,y)
```
````


```r
x <- 1:10
y <- 1:10
plot(x,y)
```

<img src="510-repro-workflows_files/figure-html/name_of_chunk-1.png" width="288" style="display: block; margin: auto 0 auto auto;" />

This includes options like: 
- fig.width
- fig.height
- cache
- echo
- results
- warning, message, and error

There's a nice reminder list at the bottom of 
[this doc](https://raw.githubusercontent.com/rstudio/cheatsheets/master/rmarkdown-2.0.pdf).

One critically important one is `cache`.
This saves the outputs of code chunks in a file, so that each time you
re-render the document, it will check if the chunk is new.
If not, it'll just load the outputs from last time.

I would recommend you use `cache=T` for any chunks with long computations.
Don't use it for generated outputs while you're modifying upstream variables,
as they won't re-generate each time you run the notebook.
Similarly, I recommend you don't cache loading libraries - these may not
load to be able to run the rest of the code.


````
```{r, name_of_chunk, fig.align="right"}
x <- 1:10
y <- 1:10
plot(x,y)
```
````


#### Document options

You can set document-level options to. To do this,
you create what's called a 
[YAML](yaml.org) header, like so:

````
---
title: "Titled"
author: "yours"
---
````

You need three hyphens to open and close it.
Put it at the very beginning. You can define
quite a few options, including *themes*,
like so:


````
---
title: "Titled"
author: "yours"
output:
    html_document:
        theme: yeti 
---
````

Note that it (`theme: yeti`) has to be indented after `html_document:`,
indented after `output:`.

For more info and practice about YAML, see this 
[YAML parser](https://nodeca.github.io/js-yaml/) to see what YAML you
are actually writing.

See more themes, and options, 
[here](https://bookdown.org/yihui/rmarkdown/html-document.html#appearance-and-style).

### Sharing with others

You'll need to share your work with others.
This means all of what was done, the numbers and graphs made, and also
_what you were thinking and what you now think_.
In science, failure is **totally** an option, and is useful if it is paired
with explanations of what didn't work. 
"Success" is fine too, I guess, but you aren't probably going to learn as much.

Either way, prepare to share!

- Keep notes and write up text about what you were thinking, what you were
    trying to do, and how it turned out.
- You can do that in between code chunks in an Rmarkdown file.
- You can also turn your Rmarkdown file into a set of presentation slides,
    by adding the following line in the YAML header:

        output: slidy_presentation

    or

        output: 
            slidy_presentation:
                theme: default
            
Also, consider how you are going to share the data or analysis files.
Ask your supervisor for details.

Think about the next person coming along to the project, 
or yourself in 3 months to a year from now. 
What do you need to understand what you did and what you learned, and how to
build off of it?





