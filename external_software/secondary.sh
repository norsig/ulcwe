#!/bin/bash

# PHPMYADMIN:
	cd "$drt"
	rm -rf ${pma}* # Regex-Wildcard Combo (RWC): Don't double-quote variable expansions; 
	wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip
	unzip ${pma}*.zip # RWC;
	mv ${pma}*/ phpmyadmin/ # RWC;
	rm ${pma}*.zip # RWC;
	chmod -R 000 "$drt"/phpmyadmin/
	cd

# WP-CLI:
	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp
	chmod +x /usr/local/bin/wp
