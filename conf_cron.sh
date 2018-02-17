#!/bin/bash
cat <<-EOF > /etc/cron.daily/cron_daily
	#!/bin/bash
	for dir in "$drt"/*/; do
		if pushd "$dir"; then
			wp plugin update --all --allow-root
			wp core update --allow-root
			wp language core update --allow-root
			wp theme update --all --allow-root
			rse
		popd
		fi
	done
EOF

cat <<-EOF > /etc/cron.weekly/cron_weekly
	#!/bin/bash
	find "${drt}" -path "*/cache/*" -type f -delete
	certbot renew -q
EOF
