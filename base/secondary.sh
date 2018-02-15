#!/bin/bash

# The following functions are called with an alias, hence has no call;

drt() {
	cd $drt/
}

nxd() {
    printf "\n\n General: \n\n" && nginx -t
    printf "\n\n Access: \n\n"  && tail /var/log/nginx/access.log
    printf "\n\n Errors: \n\n"  && tail /var/log/nginx/error.log
}

imb() {
	date="$(date +\%F-\%T)"
	mysqldump -u root -p --all-databases | zip "$drt/db-$date.zip"
	zip -r "all_zipped-$date.zip" "$drt"/ -x "*/cache/*"
	rm -f "$drt/db-$date.zip"
}

tdm() {
	chmod -R a-x,a=rX,u+w "$drt"/phpmyadmin/
	sleep 2h
	chmod -R 000 "$drt"/phpmyadmin/
	tmux kill-session
}

rse() {
	chown -R www-data:www-data "$drt"/
	chmod -R a-x,a=rX,u+w "$drt"/
	systemctl restart nginx.service
	/etc/init.d/php*-fpm restart
}
