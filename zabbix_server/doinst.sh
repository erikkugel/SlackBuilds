( if [ "$(getconf LONG_BIT)" == "64" ]; then
        LIBDIRSUFFIX="64"
else
        LIBDIRSUFFIX=""
fi )

if [ -z "$(getent group zabbix)" ]; then
        groupadd --system zabbix
fi
if [ -z "$(getent passwd zabbix)" ]; then
        useradd --system -g zabbix -d /usr/lib${LIBDIRSUFFIX}/zabbix -s /sbin/nologin -c "Zabbix Monitoring System" zabbix
fi

if [ -d /srv/www/htdocs/zabbix ]; then
        chown -RH apache:apache /srv/www/htdocs/zabbix
fi
