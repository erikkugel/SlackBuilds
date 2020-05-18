set -e

echo 'Checking for database, provide root password: '
read -s -p 'MySQL root password: ' MYSQL_PASSWD
if [ -z "$(mysql -uroot -p${MYSQL_PASSWD} -e 'SHOW DATABASES LIKE "zabbix";' -E)" ]; then
        echo 'Configuring database...'
        read -s -p 'New Zabbix database password: ' ZABBIX_DB_PASSWD
        mysql -u root -p${MYSQL_PASSWD} -e "create database zabbix character set utf8 collate utf8_bin;
create user 'zabbix'@'localhost' identified by '${ZABBIX_DB_PASSWD}';
grant all privileges on zabbix.* to 'zabbix'@'localhost';"
        echo 'Populating database, provide Zabbix database password: '
        mysql zabbix -u zabbix -p${ZABBIX_DB_PASSWD} < /usr/share/zabbix/databasescripts/mysql/schema.sql
        mysql zabbix -u zabbix -p${ZABBIX_DB_PASSWD} < /usr/share/zabbix/databasescripts/mysql/images.sql
        mysql zabbix -u zabbix -p${ZABBIX_DB_PASSWD} < /usr/share/zabbix/databasescripts/mysql/data.sql
else
        echo 'Database exists, skipping.'
fi