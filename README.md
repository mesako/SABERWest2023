This repo is for hosting notes, Rmds for the DLL 2021 R section

# How to edit/contribute to the [hosted bookdown thing](https://darachm.github.io/dll-r)

## Setup
1. Clone the repo locally 

    `git clone https://github.com/darachm/dll-r`

## Edit/work on it

1. `git pull` so you're current!
1. Make or edit the files whose name starts with two digits and ends with Rmd,
    Like `04-day3.Rmd`. Feel free to run that in Rstudio or whatever.
1. Run `./_build.sh` to build the *entire* site. Can Rstudio run this as a 
    terminal ??? There may be another way to do this in Rstudio - I believe
    they develop the bookdown package?
1. When done, pull and commit it into the main branch

    git switch main # optional, just to make sure you're on main
    git pull # to make sure you're current
    git commit -m "nice commit message of what you have done"
    git push # to push it up to github

## Publishing onto the main page, so it's hosted at the URL

1. `git switch main` # optional, just to make sure you're on main
1. `git pull` # just to make sure it's current
1. `git switch -f gh-deploy` # -f is to overwrite any changes in the `docs`
1. `git merge main` # pulls the main branch into this onne
1. `./_build.sh` # builds
1. `git add docs/*` # adds the entire site to the repo
1. `git commit -m "updated for whatever reason, change this"`
1. `git push`
1. `git switch main` # for more editing

