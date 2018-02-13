#!/bin/bash
"$HOME"/"$repo"/external_software/basics.sh
"$HOME"/"$repo"/external_software/pma.sh
"$HOME"/"$repo"/external_software/wp-cli.sh

"$HOME"/"$repo"/configurations/nginx.sh
"$HOME"/"$repo"/configurations/php.sh

mv "$HOME"/"$repo"/templates/cron_daily /etc/cron.daily/cron_daily
mv "$HOME"/"$repo"/templates/cron_weekly /etc/cron.weekly/cron_daily
