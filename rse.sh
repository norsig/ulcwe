#!/bin/bash
chown -R www-data:www-data "$drt"/
chmod -R a-x,a=rX,u+w "$drt"/
systemctl restart nginx.service
/etc/init.d/php*-fpm restart
