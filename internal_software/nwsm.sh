#!/bin/bash
domain="$1" && test -z "$domain" && exit 2
read -sp "DB user password:" dbrootp
read -sp "DB user password:" dbuserp

wp core download --path="$drt"/"$domain"/ --allow-root
wp config create --path="$drt"/"$domain"/ --dbname="$domain" --dbuser="$domain" --dbpass="$dbuserp" --dbhost="localhost" --allow-root

sed "s/\$domain/$1/g" "$HOME/$repo/templates/nginx_app" > "$s_a/$domain.conf"
ln -sf "$s_a"/"$domain".conf "$s_e"

cat <<-DBSTACK | mysql -u root -p"$dbrootp"
	CREATE USER "$domain"@"localhost" IDENTIFIED BY "$dbuserp";
	CREATE DATABASE "$domain";
	GRANT ALL PRIVILEGES ON "$domain".* TO "$domain"@"localhost";
DBSTACK

"$rse"
certbot --nginx -d "$domain" -d www."$domain"
"$rse"
