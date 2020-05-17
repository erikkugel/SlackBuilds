set -e

echo 'Checking for database, provide root password: '
if [ -z "$(mysql -uroot -p -e 'SHOW DATABASES LIKE "zabbix";' -E)" ]; then
        echo 'Configuring database...'
        read -s -p 'New Zabbix database password: ' DB_PASSWD
        echo 'Populating database, provide Zabbix database password: '
        mysql -uroot -p -e "create database zabbix character set utf8 collate utf8_bin;
create user 'zabbix'@'localhost' identified by \"${DB_PASSWD}\";
grant all privileges on zabbix.* to 'zabbix'@'localhost';"
        mysql zabbix -uzabbix -p"${DB_PASSWD}" < /usr/share/zabbix/databasescripts/mysql/schema.sql
        mysql zabbix -uzabbix -p"${DB_PASSWD}" < /usr/share/zabbix/databasescripts/mysql/images.sql
        mysql zabbix -uzabbix -p"${DB_PASSWD}" < /usr/share/zabbix/databasescripts/mysql/data.sql
else
        echo "Database exists, skipping"
fi