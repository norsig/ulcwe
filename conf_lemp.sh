#!/bin/bash
cat <<-EOF > "$s_a"/default
	server {
		listen 80 default_server;
		listen [::]:80 default_server;
		root /var/www/html;
		index index.php index.html index.htm index.nginx-debian.html;
		server_name _;

		location / {try_files $uri $uri/ =404;}
		location ~ \.php$ {
			include snippets/fastcgi-php.conf;
			fastcgi_pass unix:/run/php/php7.0-fpm.sock;
		}
	}
EOF

for dir in /etc/php/*/fpm/; do
cat <<-EOF > "$dir"/zz_overrides.ini
	[PHP]
	post_max_size = 2000M
	upload_max_filesize = 2000M
	max_execution_time = 3000
	cgi.fix_pathinfo=0
EOF
done
"$rse"
