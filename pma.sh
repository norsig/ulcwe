#!/bin/bash
cd "$drt"
rm -rf "$pma"*
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip
unzip "$pma"*.zip
mv "$pma"*/ phpmyadmin/
rm "$pma"*.zip
chmod -R 000 "$drt"/phpmyadmin/
cd
