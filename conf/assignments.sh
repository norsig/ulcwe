#!/bin/bash

set -a
repo="ulcwe"
s_a="/etc/nginx/sites-available"
s_e="/etc/nginx/sites-enabled"
drt="/var/www/html"
pma="[pP][hH][pP][mM][yY][aA][dD][mM][iI][nN]"
rse="$HOME/$repo/personal_software/rse.sh"
set +a

alias drt="cd $drt/"
alias rse="$HOME/$repo/personal_software/rse.sh"
alias nxd="$HOME/$repo/personal_software/nxd.sh"
alias imb="$HOME/$repo/personal_software/imb.sh"
alias nws="$HOME/$repo/personal_software/nws.sh"
alias tdm="tmux new-session -d 'bash $HOME/$repo/personal_software/tdm.sh'"
