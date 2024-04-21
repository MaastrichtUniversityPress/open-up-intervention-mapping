### In Plesk, execute with:
### bash deploy.sh >> deployment.log 2>&1
### Cran job for executing every hour with logging
### @hourly bash ~/git_clone_hpss/deploy.sh >> ~/git_clone_hpss/deployment.log 2>&1
### https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/
### To edit the cron file with nano instead of vim:
### export VISUAL=nano; crontab -e


echo ----------
echo $(date)

### Go to directory with cloned git repo
cd ~/im-wb_pulled_repo

### Set the path so LaTeX can be found
PATH=$PATH:/var/www/vhosts/im-wb.com/.phpenv/shims:/opt/plesk/phpenv/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/var/www/vhosts/sysrevving.com/.TinyTeX/bin/x86_64-linux

### Delete old 'public' directory if it exists
#rm -rf public

pwd
echo $PATH
echo Calling Quarto

### Render the site
/usr/local/bin/quarto render --to all
#/usr/local/bin/R -e "source('download_and_save_bibliography.R')"
#/usr/local/bin/R -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
#/usr/local/bin/R -e "options(tinytex.verbose = TRUE);bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
#/usr/local/bin/R -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"


echo Finished Quarto

### Delete all contents in public HTML directory
rm -rf ~/public_html/*.*
rm -rf ~/public_html/*
rm -f ~/public_html/.htaccess

### Copy website
cp -RT public ~/public_html

### Copy PDF
cp im-wb.pdf ~/public_html

### Copy .htaccess
cp .htaccess ~/public_html

echo ----------
