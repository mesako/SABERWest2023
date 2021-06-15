
## How to edit this document

Here is a too-long video about how to edit this website.

<iframe width="560" height="315" src="https://www.youtube.com/embed/LWTQiK9t9ks" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Each level 1 header is its own heading the left TOC

### Setup
1. Clone the repo locally 

    `git clone https://github.com/darachm/dll-r`

### Edit/work on it

- `git pull` so you're current! Error with what is in `docs/`?
    Do `git checkout docs/` to remove the edits to those, then `pull` again.
- Make or edit the files whose name starts with two digits and ends with Rmd,
    Like `01-day3.Rmd`. Feel free to run that in Rstudio or whatever.
- To test the full site, sun `./_build.sh` to build the *entire* site. 
    ( Can Rstudio run this as a terminal ??? 
    There may be another way to do this in Rstudio - I believe
    they develop the bookdown package? )
    The entire site is in `docs/` because that is what github wants.
- When done, add and commit your changes.

        git add 02-day4.Rmd # or whatever you changed
        git commit -m "nice commit message of what you have done"
        git checkout docs/ # this prevents errors from docs not matching what's published
        git pull # to make sure current
        git push # to push it up to github

### Publishing onto the main page, so it's hosted at the URL

    git pull # to make sure current

    # if there are conflicts, then run
    git checkout docs/ # this prevents errors from docs not matching what's published
    # if not, you can skip this step!

    ./_build.sh # builds the site in docs/
    git add docs/* # adds the entire site to the repo
    git commit -m "updated site"
    git push # to push it up to github


<!--
Reference a figure by its code chunk label with the `fig:` prefix, e.g., see Figure \@ref(fig:nice-fig). Similarly, you can reference tables generated from `knitr::kable()`, e.g., see Table \@ref(tab:nice-tab).
-->
