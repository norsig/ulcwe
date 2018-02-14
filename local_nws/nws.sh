#!/bin/bash

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
