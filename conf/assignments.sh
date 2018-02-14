#!/bin/bash

set -a
repo="ulcwe"
s_a="/etc/nginx/sites-available"
s_e="/etc/nginx/sites-enabled"
drt="/var/www/html"
pma="[pP][hH][pP][mM][yY][aA][dD][mM][iI][nN]"
rse="$HOME/$repo/internal_software/rse.sh"
set +a

alias drt="cd $drt/"
alias rse="$rse"
alias nxd="$HOME/$repo/internal_software/nxd.sh"
alias imb="$HOME/$repo/internal_software/imb.sh"
alias nwsm="$HOME/$repo/internal_software/nwsm.sh"
alias nwsm_undo="$HOME/$repo/internal_software/nwsm_undo.sh"
alias tdm="tmux new-session -d 'bash $HOME/$repo/internal_software/tdm.sh'"
