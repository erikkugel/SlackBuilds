groupadd zabbix
useradd -g zabbix zabbix

if [ ! -d /var/www/htdocs/zabbix ]; then
	mkdir -v -p /var/www/htdocs/zabbix
	cd /usr/local/share/zabbix/frontends/php
	cp -v -a . /var/www/htdocs/zabbix
	chown -c -R apache:apache /var/www/htdocs/zabbix
fi

if [ -f /etc/httpd/httpd.conf ] && [ -z "$(grep 'Include /etc/httpd/extra/httpd-zabbix.conf' /etc/httpd/httpd.conf)" ]; then
	echo "Include /etc/httpd/extra/httpd-zabbix.conf" >> /etc/httpd/httpd.conf
	/etc/rc.d/rc.httpd graceful
fi
