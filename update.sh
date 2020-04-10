#/!bin/bash
python3 get_data.py
python3 plot_cases.py
python3 plot_deaths.py
printf -v date '%(%Y%m%d)T' -1
sed -i 's/-[0-9]\{8\}/-'$date'/g' README.md
sed -i 's/-[0-9]\{8\}/-'$date'/g' email_template.html
git add -A
git commit -m "update $date"
git push
mailx -a 'Content-Type: text/html' -s "Covid 19 figures $date" mail@c-holtermann.net < email_template.html
