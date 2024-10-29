#!/bin/sh

LOGFILE=/var/log/mariadb_init.log

echo "Starting MariaDB initialization script v7"
service mariadb start >> $LOGFILE 2>&1
until mysqladmin ping -u root --silent; do
	echo "MariaDB is still starting up..."
	sleep 2
done
echo "ca marche"
mariadb -u root -p$MYSQL_ROOT_PASSWORD << EOS
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
EOS
mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "SHOW GRANTS FOR '$MYSQL_USER'@'%';" >> $LOGFILE 2>&1

service mariadb stop
exec "$@"
