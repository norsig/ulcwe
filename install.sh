#!/bin/bash
export repo="ulcwe"

apt-get update -y
apt-get upgrade git -y
git clone https://github.com/benqzq/"$repo" --depth 1 --branch=master "$HOME"/"$repo"/
rm -rf "$HOME"/"$repo"/.git/
chmod +x "$HOME"/"$repo"/* -R

printf "%s\n" "source $HOME/$repo/configurations/variables.sh" >> $HOME/.bashrc
printf "source $HOME/$repo/configurations/aliases.sh" >> $HOME/.bashrc
source "$HOME"/.bashrc 2>/dev/null

"$HOME"/"$repo"/external_software/{basics.sh,pma.sh,wp-cli.sh}
"$HOME"/"$repo"/configurations/{nginx.sh,php.sh}
mv "$HOME"/"$repo"/templates/cron_daily /etc/cron.daily/cron_daily,cron_daily}

"$rse"
