
## What is a workflow?

What does it take to do an analysis?

When you embark on some project, it's helpful (but not necessary) to plan
where you are going. 
It's best to setup and keep track of factors like:

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

So let's start building up some skills!

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
Ask your supervisor.

---

Here's one diagram:

<img src="https://storage.googleapis.com/plos-corpus-prod/10.1371/journal.pcbi.1000424/1/pcbi.1000424.g001.PNG_L?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=wombat-sa%40plos-prod.iam.gserviceaccount.com%2F20210612%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20210612T004314Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=2ae284989b7dd8d846c50bfe02ab95a30e17263bb5160661aec71c2f43ec3285f1f9d583f3029e0afb984e92cabdcbf7731ea00606e88ee14bc99ac88465fe70a2246248e4a3dc756d8cbb826e5199fe60a6052b002ca41f783b64b1200be0404c0d5bdff582a9fe8228acc1d5c298bff42fc51d31d9f819457fe6ca04649ed2fcdaaf67fcc5c3e86b74b8c5a8fb3282e5c0391bb60206c0f65b2748575f507fc5fb732c861b6cc6210cb03f51f03d882dffe234c5c5050a0e6eb619f51beab1d17980d7d1d09947a2a1008dcd3a4e0727062e501c04e1e54f75621283449a305155cba0fe971391f3a9a21ca1e3d172615782e974215c18e00f317d54baa4f6"
    alt="Example from Noble PLoS 2009" width="100%"/>

---

Work in groups.
Take your work from yesterday, on teh tidyverse stuff.
Go ahead and set that up as a separate demo, maybe call it `tidyverse-demo`.

Setup the appropriate folder structures.
Put stuff in there
Run it

Discuss in a group how you organize your work, what you think would be useful.
What are some disadvantages to this system?
Can you work around those?

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
distribute results from.

---

How do you usually save notes/code/instructions?

How are you saving your notes for this class?

How do you share this with others?

Let's take one of the 

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
They generate [a lot of helpful "cheatsheets"](https://raw.githubusercontent.com/rstudio/cheatsheets/master/rmarkdown-2.0.pdf) too.

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
theme: yeti 
---
````

See more themes, and options, [here](https://bookdown.org/yihui/rmarkdown/html-document.html#appearance-and-style).

---

Spruce up your rmarkdown. Go ahead and change the time,
some of the options in the header.
Change soem chunk options, maybe cahce to go faster

When you're done, share any new tricks or useful ideas in teh slack channel,
or in your groups.

### Sharing with others

How are you going to share the outputs with others?
When do they just need the HTML file?

What does someone need to re-run your analyses?
When do they need your code and your data?

When you start generating research output (analyses, etc), ask your
supervisor about how they are going to store your work.
Where does the data live, so that someone can access it again?
Where does the code live, so that someone else can use it?
Where do the lessons learned go?

Think about the next person coming along, or yourself in 3 months.

