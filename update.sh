#/!bin/bash
python3 get_data.py
python3 plot_cases.py
python3 plot_deaths.py
printf -v date '%(%Y%m%d)T' -1
sed -i 's/-[0-9]\{8\}/-'$date'/g' README.md
git add -A
git commit -m "update $date"
git push
