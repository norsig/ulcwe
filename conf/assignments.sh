#!/bin/bash

nonenvar_variables() {
	set -a
		s_a="/etc/nginx/sites-available"
		s_e="/etc/nginx/sites-enabled"
		drt="/var/www/html"
		pma="[pP][hH][pP][mM][yY][aA][dD][mM][iI][nN]"
		rse="misc/rse.sh"
	set +a
}
nonenvar_variables

aliases() {
	alias drt="cd $drt/"
	alias rse="comm/rse.sh"
	alias nxd="comm/nxd.sh"
	alias imb="misc/imb.sh"
	alias tdm="tmux new-session -d 'bash misc/tdm.sh'"
	alias nwsm="nwsm/nwsm.sh"
}
aliases
