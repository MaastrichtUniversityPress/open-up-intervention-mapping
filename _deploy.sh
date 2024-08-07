### In Plesk, execute with:
### bash _deploy.sh >> _deployment.log 2>&1

echo ----------
echo Starting at: $(date)

### Go to directory with cloned git repo
cd ~/im-wb_pulled_repo

### Set the path so LaTeX can be found
PATH=$PATH:/var/www/vhosts/im-wb.com/.phpenv/shims:/opt/plesk/phpenv/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/var/www/vhosts/sysrevving.com/.TinyTeX/bin/x86_64-linux

### Delete old 'public' directory if it exists
#rm -rf public

echo Current directory: $(pwd)
echo Current '$PATH': $PATH
echo Running Quarto

### Render the site
/usr/local/bin/quarto render --to all
#/usr/local/bin/R -e "source('download_and_save_bibliography.R')"
#/usr/local/bin/R -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
#/usr/local/bin/R -e "options(tinytex.verbose = TRUE);bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
#/usr/local/bin/R -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"

echo Finished Quarto. Deleting old contents...

### Delete all contents in public HTML directory
rm -rf ~/public_html/*.*
rm -rf ~/public_html/*
rm -f ~/public_html/.htaccess

echo Deleted old contents. Copying new contents...

### Copy website
cp -RT public ~/public_html

### Copy PDF
cp im-wb.pdf ~/public_html
cp im-wb.epub ~/public_html

### Copy .htaccess
cp .htaccess ~/public_html

echo Finished at: $(date)
echo ----------
