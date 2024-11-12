echo "Bonjour test"
mysqld_safe --datadir='/var/lib/mysql' &

until mysqladmin ping >/dev/null 2>&1; do
    echo "Waiting for MariaDB to start..."
sleep 5
done

echo $MYSQL_DATABASE 
echo $MYSQL_USER
echo $MYSQL_PASSWORD 
mariadb -u root <<EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS SQL_Inception;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER 'yaainouc'@'%' IDENTIFIED BY 'changeme';
GRANT ALL PRIVILEGES ON SQL_Inception.* TO 'yaainouc'@'%' WITH GRANT OPTION;
SELECT User, Host, Password FROM mysql.user;
FLUSH PRIVILEGES;
EOF

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'changeme';"
echo "bonjour"
mysqladmin -u root -p'changeme' shutdown

sleep 5

mysqld
