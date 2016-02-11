echo "Create database if needed:
mysql -uroot -p -e \"CREATE DATABASE IF NOT EXISTS zabbix CHARACTER SET utf8 COLLATE utf8_bin;
 GRANT ALL PRIVILEGES ON zabbix.* TO zabbix@localhost IDENTIFIED BY 'zabbix';\"
cd /usr/local/share/zabbix/databasescripts/mysql
mysql -uzabbix -p${zabbix_password} zabbix < ./schema.sql
mysql -uzabbix -p${zabbix_password} zabbix < ./images.sql
mysql -uzabbix -p${zabbix_password} zabbix < ./data.sql"
