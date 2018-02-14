#!/bin/bash
domain="$1" && test -z "$domain" && exit 2

read -sp "DB user password:" dbrootp_1       && echo
read -sp "DB user password again:" dbrootp_2 && echo
read -sp "DB user password:" dbuserp_1       && echo
read -sp "DB user password again:" dbuserp_2 && echo

if [ "$dbrootp_1" != "$dbrootp_2" ]; then echo "Values unmatched" && exit 1 fi
if [ "$dbuserp_1" != "$dbuserp_2" ]; then echo "Values unmatched" && exit 1 fi

wp core download --path="$drt"/"$domain"/ --allow-root
wp config create --path="$drt"/"$domain"/ --dbname="$domain" --dbuser="$domain" --dbpass="$dbuserp" --dbhost="localhost" --allow-root

cat <<-EOF > "$s_a/$domain.conf"
server {
	root ${drt}/${domain}/;
	server_name ${domain} www.${domain};
	location ~* \.(jpg|jpeg|png|gif|ico|css|js|ttf|woff|pdf)$ {expires 365d;}
	location "/wp-login\.php" {access_log "/var/log/httpd/wordpress-logins.log";}
}
EOF
ln -sf "$s_a"/"$domain".conf "$s_e"

cat <<-EOF | mysql -u root -p"$dbrootp"
	CREATE USER "$domain"@"localhost" IDENTIFIED BY "$dbuserp";
	CREATE DATABASE "$domain";
	GRANT ALL PRIVILEGES ON "$domain".* TO "$domain"@"localhost";
EOF

"$rse"
certbot --nginx -d "$domain" -d www."$domain"
"$rse"
