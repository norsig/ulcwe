#!/bin/bash
wp core download --path="$drt"/"$domain"/ --allow-root
wp config create --path="$drt"/"$domain"/ --dbname="$domain" --dbuser="$domain" --dbpass="$dbuserp" --dbhost="localhost" --allow-root
