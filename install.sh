#!/bin/bash
export user="benqzq"
export repo="ulcwe"

preparations() {	
	cat <<-EOF >> "$HOME"/.bashrc

		export s_a="/etc/nginx/sites-available"
		export s_e="/etc/nginx/sites-enabled"
		export drt="/var/www/html"
		source "$HOME"/$repo/software_internal.sh
	EOF
	source "$HOME"/.bashrc 2>/dev/null
}
preparations

localize() {
	apt-get update -y
	apt-get upgrade git -y
	git clone https://github.com/"$user"/"$repo" --depth 1 --branch=master "$HOME"/"$repo"/
	rm -rf "$HOME"/"$repo"/.git/
	chmod +x "$HOME"/"$repo"/* -R
}
localize

execute() {
	"$HOME"/$repo/software_external.sh
	"$HOME"/$repo/conf_lemp.sh
	"$HOME"/$repo/conf_cron.sh
	rse
}
execute
