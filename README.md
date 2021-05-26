This repo is for hosting notes, Rmds for the DLL 2021 R section

# How to edit/contribute to the [hosted bookdown thing](https://darachm.github.io/dll-r)

1. clone the repo locally - make sure to `git pull` so you're current!
1. make or edit the files whose name starts with two digits and ends with Rmd,
    Like `01-intro.Rmd`
1. commit changes into the "main" branch (add the file if new)
1. `git switch gh-deploy`
1. `git merge main`
1. `./_build.sh`
1. `git add docs/*`
1. `git commit -m "updated for whatever reason, change this"`
1. `git push`
1. `git switch main`

