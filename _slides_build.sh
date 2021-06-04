#!/bin/sh

set -ev

#Rscript -e "bookdown::render_book('index.Rmd','bookdown::gitbook')"

# render slides day 3
echo "book_filename: 'dllr-day3.Rmd'" > _tmp.yml
cat _slides_base.yml >> _tmp.yml
ls 3*Rmd | sed 's/^/  - "/' | sed 's/$/"/' >> _tmp.yml
Rscript -e "bookdown::preview_chapter(list.files(pattern = '3.*Rmd'), 'rmarkdown::slidy_presentation',config_file='_tmp.yml')"
mv dllr-day3.html docs/slides
rm _tmp.yml

# render slides day 4
echo "book_filename: 'dllr-day4.Rmd'" > _tmp.yml
cat _slides_base.yml >> _tmp.yml
ls 4*Rmd | sed 's/^/  - "/' | sed 's/$/"/' >> _tmp.yml
Rscript -e "bookdown::preview_chapter(list.files(pattern = '4.*Rmd'), 'rmarkdown::slidy_presentation',config_file='_tmp.yml')"
mv dllr-day4.html docs/slides
rm _tmp.yml

# render slides day 5
echo "book_filename: 'dllr-day5.Rmd'" > _tmp.yml
cat _slides_base.yml >> _tmp.yml
ls 5*Rmd | sed 's/^/  - "/' | sed 's/$/"/' >> _tmp.yml
Rscript -e "bookdown::preview_chapter(list.files(pattern = '5.*Rmd'), 'rmarkdown::slidy_presentation',config_file='_tmp.yml')"
mv dllr-day5.html docs/slides
rm _tmp.yml
