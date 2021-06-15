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

- [Claus Wilke's dataviz bookdown](https://clauswilke.com/dataviz/)
- [Computational Genomics with R](https://compgenomr.github.io/book/)
- [UC Davis bioinformatics trainings](https://ucdavis-bioinformatics-training.github.io/)
- [R Programming for Data Science](https://bookdown.org/rdpeng/rprogdatascience/)
- [Biostars books on scripting, programming, genomics](https://www.biostars.org/p/225812/)

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



