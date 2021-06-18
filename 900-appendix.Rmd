# Appendix 

## Some links and some extras

This is for collecting factoids, ideas, and links that may be useful 
as reference (if not inspiration) for your future R practice.

### Ideas for figures

- An [interactive page](https://ft-interactive.github.io/visual-vocabulary/)
    showing different types of figures
- A [R graph gallery](https://www.r-graph-gallery.com/)
- Claus Wilke's [cowplot](https://cran.r-project.org/web/packages/cowplot/vignettes/introduction.html) 
    package is a great way to make multi-panel figures with ggplot, so A B etc.

### More links

- [swirl](https://swirlstats.com/)]
    is an excellent interactive tutorial package you can install and work 
    through yourself for more practice, 
    get [started here](https://swirlstats.com/students.html)

- [A whole bunch of cheatsheets and example sheets of common commands and ways to do things](https://www.rstudio.com/resources/cheatsheets/#contributed-cheatsheets), 
    check under "Contributed Cheatsheets" for some great ones, or browse them all

- [Claus Wilke's dataviz bookdown](https://clauswilke.com/dataviz/)
- [Computational Genomics with R](https://compgenomr.github.io/book/)
- [UC Davis bioinformatics trainings](https://ucdavis-bioinformatics-training.github.io/)
- [R Programming for Data Science](https://bookdown.org/rdpeng/rprogdatascience/)
- [Biostars books on scripting, programming, genomics](https://www.biostars.org/p/225812/)
- [Some basic non-tidyverse common commands](https://www.maths.usyd.edu.au/u/jchan/Rcommands.pdf)

### More about workflows

We talked about workflows in R, but much of bioinformatics workflows are
happening outside of R, in bash (etc).
To handle those, there are more sophisticated workflows that will 
generate steps from combinations of parameters, schedule and allocate those
across HPC and remote commercial (amazon/google) computing, and automatically
generate analytics and reports to help you optimize your workflows.

These include SnakeMake, Nextflow, and CWL. And others, but these are the
main ones.
This author recommends Nextflow. There's a bit more of a learning curve than
SnakeMake, but it is well built and very flexible. 

These will not be necessary for summer projects, but may be useful skills
for bioinformatics research for at least the next 5-10 years.


### Rmarkdown for slides

Want to put a bunch of R plots into some slides?
You can also turn your Rmarkdown file into a set of presentation slides,
by adding the following line in the YAML header:

    output: slidy_presentation

    output: 
        slidy_presentation:
            theme: default
            
This makes a HTML file you can open in your browser, like slides (left, right
for the slides).
