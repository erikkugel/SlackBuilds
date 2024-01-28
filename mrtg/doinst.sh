#!/bin/sh

# Create user
if [ -z "$(getent passwd mrtg)" ]; then
	/usr/sbin/useradd -r -U -c 'MRTG' mrtg
fi

chown mrtg:mrtg /var/run/mrtg /var/log/mrtg /var/lock/mrtg /var/www/htdocs/mrtg

if [ -f /etc/mrtg.cfg ]; then
	CFG_OUTPUT=/etc/mrtg.cfg.new
else
	CFG_OUTPUT=/etc/mrtg.cfg
fi
/usr/bin/cfgmaker \
	--global 'WorkDir: /var/www/htdocs/mrtg' \
	--global 'Options[_]: bits,growright' \
	--global 'RunAsDaemon: Yes' \
	--ifref=ip \
	--output ${CFG_OUTPUT} \
	"public@${HOSTNAME}"

