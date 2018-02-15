#!/bin/bash
localize() {
	export repo="ulcwe"
	export user="benqzq"
	apt-get update -y
	apt-get upgrade git -y
	git clone https://github.com/"$user"/"$repo" --depth 1 --branch=master "$HOME"/"$repo"/
	rm -rf "$HOME"/"$repo"/.git/
	chmod +x "$HOME"/"$repo"/* -R
	printf "%s\n" "source $HOME/$repo/conf/assignments.sh" >> $HOME/.bashrc
	source "$HOME"/.bashrc 2>/dev/null
}
localize

install() {
	communal_software/primary.sh
	communal_software/secondary.sh

	conf/nginx_default.sh
	conf/php.sh

	mv conf/cron_daily /etc/cron.daily/cron_daily
	mv conf/cron_weekly /etc/cron.daily/cron_weekly

	"$rse"
}
install
