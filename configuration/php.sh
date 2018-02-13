#!/bin/bash
phpConf() {
	for dir in /etc/php/*/fpm/; do
		cat <<-EOF > "$dir"/zz_overrides.ini
			[PHP]
			post_max_size = 2000M
			upload_max_filesize = 2000M
			max_execution_time = 3000
			cgi.fix_pathinfo=0
		EOF
	done
}
phpConf
