This repo is for hosting notes, Rmds for the DLL 2021 R section

# How to edit/contribute to the [hosted bookdown thing](https://darachm.github.io/dll-r)

Which is accessible at 
[darachm.github.io/dll-r](https://darachm.github.io/dll-r)

## Setup
1. Clone the repo locally 

    `git clone https://github.com/darachm/dll-r`

## Edit/work on it

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

## Publishing onto the main page, so it's hosted at the URL

    git checkout docs/ # this prevents errors from docs not matching what's published
    git pull # to make sure current
    ./_build.sh # builds the site in docs/
    git add docs/* # adds the entire site to the repo
    git commit -m "updated site"
    git push # to push it up to github
