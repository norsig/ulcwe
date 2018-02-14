#!/bin/bash
domain="$1" && test -z "$domain" && exit 2

read -sp "DB root password? I1" dbrootp_1 && echo
read -sp "DB root password? I2" dbrootp_2 && echo
if [ "$dbrootp_1" != "$dbrootp_2" ]; then echo "Values unmatched" && exit 1 fi

read -sp "DB user password? I1" dbuserp_1 && echo
read -sp "DB user password? I2" dbuserp_2 && echo
if [ "$dbuserp_1" != "$dbuserp_2" ]; then echo "Values unmatched" && exit 1 fi
