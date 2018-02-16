#!/bin/bash
export user="benqzq"
export repo="ulcwe"

preparations() {	
	cat <<-EOF >> "$HOME"/.bashrc

		s_a="/etc/nginx/sites-available"
		s_e="/etc/nginx/sites-enabled"
		drt="/var/www/html"
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

install() {
	"$HOME"/$repo/software_external.sh
	"$HOME"/$repo/software_internal.sh
	"$HOME"/$repo/conf/lemp.sh
	"$HOME"/$repo/conf/cron.sh
	"$rse"
}
install
