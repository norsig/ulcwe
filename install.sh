#!/bin/bash
export repo="ulcwe"
apt-get update -y
apt-get upgrade git -y
git clone https://github.com/benqzq/"$repo" --depth 1 --branch=master "$HOME"/"$repo"/
rm -rf "$HOME"/"$repo"/.git/
chmod +x "$HOME"/"$repo"/* -R

printf "%s\n" "source $HOME/$repo/conf/assignments.sh" >> $HOME/.bashrc
source "$HOME"/.bashrc 2>/dev/null

"$HOME"/"$repo"/communal_software/primary.sh
"$HOME"/"$repo"/communal_software/secondary.sh

"$HOME"/"$repo"/conf/nginx_default.sh
"$HOME"/"$repo"/conf/php.sh
mv "$HOME"/"$repo"/conf/cron_daily /etc/cron.daily/cron_daily}
mv "$HOME"/"$repo"/conf/cron_weekly /etc/cron.daily/cron_weekly}

"$rse"
