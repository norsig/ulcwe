#!/bin/bash

phpmyadmin() {
	cd "$drt"
	rm -rf "$pma"*
	wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip
	unzip "$pma"*.zip
	mv "$pma"*/ phpmyadmin/
	rm "$pma"*.zip
	chmod -R 000 "$drt"/phpmyadmin/
	cd
}
phpmyadmin

wp-cli() {
	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp
	chmod +x /usr/local/bin/wp
}
wp-cli
