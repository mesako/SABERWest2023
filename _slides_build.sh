#!/bin/sh

set -ev

#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

Rscript -e "bookdown::render_book('index.Rmd','xaringan::moon_reader',output_dir='docs/slides/', output_file='docs/slides/index.html')"

