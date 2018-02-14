#!/bin/bash
date="$(date +\%F-\%T)"
mysqldump -u root -p --all-databases | zip "$drt/db-$date.zip"
zip -r "all_zipped-$date.zip" "$drt"/ -x "*/cache/*"
rm -f "$drt/db-$date.zip"
