#!/bin/bash

security() {
	ufw --force enable
	ufw allow 22,25,80,443,9000/tcp
	apt-get upgrade unattended-upgrades sshguard -y
}
security

lemp() {
	apt-get upgrade nginx mysql-server php-fpm php-mysql -y
	apt-get upgrade php-mbstring php-mcrypt -y
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
