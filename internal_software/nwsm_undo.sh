#!/bin/bash
domain="$1" && test -z "$domain" && exit 2
read -sp "DB user password:" dbrootp

rm -rf "$drt"/"$domain"/
rm "$s_a"/"$domain".conf "$s_e"/"$domain".conf

cat <<-DBSTACK | mysql -u root -p"$dbrootp"
	DROP USER IF EXISTS "$domain"@"localhost";
	DROP database IF EXISTS "$domain";
DBSTACK

"$rse"
