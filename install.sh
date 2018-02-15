#!/bin/bash

primaryNonNativeEnvars() {
	cat <<-EOF >> "$HOME"/.bashrc

		export user="benqzq"
		export repo="ulcwe"
		source $path/conf/assignments.sh
	EOF
	source "$HOME"/.bashrc 2>/dev/null
}
primaryNonNativeEnvars

localize() {
	apt-get update -y
	apt-get upgrade git -y
	git clone https://github.com/"$user"/"$repo" --depth 1 --branch=master "$HOME"/"$repo"/
	rm -rf "$HOME"/"$repo"/.git/
	chmod +x "$HOME"/"$repo"/* -R
}
localize

install() {
	comm/primary.sh
	comm/secondary.sh
	conf/nginx_default.sh
	conf/php.sh
	mv conf/cron_daily /etc/cron.daily/cron_daily
	mv conf/cron_weekly /etc/cron.daily/cron_weekly
	"$rse"
}
install
