mysqld_safe --datadir='/var/lib/mysql' & > /dev/null 2>&1

until mysqladmin ping >/dev/null 2>&1; do
    echo "Waiting for MariaDB to start..."
    sleep 5
done
mariadb -u root <<EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS SQL_Inception;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER 'yaainouc'@'%' IDENTIFIED BY 'changeme';
GRANT ALL PRIVILEGES ON SQL_Inception.* TO 'yaainouc'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'changeme';"
mysqladmin -u root -p'changeme' shutdown
echo "[MARIADB] Starting Mariadb...."
mysqld > /dev/null 2>&1
echo "[MARIADB] Mariadb started successfully."
