#!/bin/bash
cat <<-EOF >> "$HOME"/.bashrc
	user="benqzq"
	repo="ulcwe"
	s_a="/etc/nginx/sites-available"
	s_e="/etc/nginx/sites-enabled"
	drt="/var/www/html"

	alias nwsm="$HOME/$repo/nwsm/nwsm.sh"
	
	source "$HOME"/$repo/bash/primary.sh
EOF	
source "$HOME"/.bashrc 2>/dev/null

localize() {
	apt-get update -y
	apt-get upgrade git -y
	git clone https://github.com/"$user"/"$repo" --depth 1 --branch=master "$HOME"/"$repo"/
	rm -rf "$HOME"/"$repo"/.git/
	chmod +x "$HOME"/"$repo"/* -R
}
localize

install() {
	bash/secondary.sh
	conf/cron.sh
	conf/nginx_default.sh
	conf/php.sh
	"$rse"
}
install
