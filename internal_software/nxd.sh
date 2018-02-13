#!/bin/bash
printf "\n\n General: \n\n"
nginx -t
printf "\n\n Access: \n\n"
tail /var/log/nginx/access.log
printf "\n\n Errors: \n\n"
tail /var/log/nginx/error.log
