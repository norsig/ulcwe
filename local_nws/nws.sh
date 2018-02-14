#!/bin/bash
domain="$1" && test -z "$domain" && exit 2

read -sp "Please enter DB root password:      " dbrootp_1 \
read -sp "Please enter DB root password again:" dbrootp_2 \
if [ "$dbrootp_1" != "$dbrootp_2" ]; then echo "Values unmatched" && exit 1 fi

read -sp "Please enter DB user password:      " dbuserp_1 \
read -sp "Please enter DB user password again:" dbuserp_2 \
if [ "$dbuserp_1" != "$dbuserp_2" ]; then echo "Values unmatched" && exit 1 fi

"$PWD"/tests.sh
"$PWD"/wp-cli.sh
"$PWD"/nginx.sh
"$PWD"/dbstack.sh
"$PWD"/certbot.sh
