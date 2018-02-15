#!/bin/bash

security() {
	ufw --force enable
	ufw allow 22,25,80,443,9000/tcp
	apt-get upgrade unattended-upgrades sshguard -y
}
security

lemp() {
	apt-get upgrade nginx mysql-server php-fpm php-mysql -y
}
lemp

certbot() {
	add-apt-repository ppa:certbot/certbot -y
	apt-get update -y
	apt-get upgrade python-certbot-nginx -y
}
certbot

misc() {
	apt-get upgrade zip unzip tree -y
	DEBIAN_FRONTEND=noninteractive apt-get upgrade postfix -y
}
misc

phpmyadmin() {
	apt-get upgrade php-mbstring php-mcrypt phpmyadmin -y
	ln -s /usr/share "$drt"
	chmod -R 000 /usr/share/phpmyadmin/
}
phpmyadmin

wp-cli() {
	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp
	chmod +x /usr/local/bin/wp
}
wp-cli
