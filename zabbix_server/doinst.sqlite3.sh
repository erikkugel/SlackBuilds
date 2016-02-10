if [ ! -f /usr/local/var/lib/sqlite/zabbix.db ]; then
        mkdir -v -p /usr/local/var/lib/sqlite
        touch /usr/local/var/lib/sqlite/zabbix.db
	
        cd /usr/local/share/zabbix/databasescripts/sqlite3
        sqlite3 /usr/local/var/lib/sqlite/zabbix.db < schema.sql
        sqlite3 /usr/local/var/lib/sqlite/zabbix.db < images.sql
        sqlite3 /usr/local/var/lib/sqlite/zabbix.db < data.sql
	sed -i 's|DBName=\S.*|DBName=/usr/local/var/lib/sqlite/zabbix.db|' /usr/local/etc/zabbix_server.conf

	chown zabbix:apache /usr/local/var/lib/sqlite/zabbix.db
	chmod -c g+w /usr/local/var/lib/sqlite/zabbix.db
fi
