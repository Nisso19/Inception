mysqld_safe --datadir='/var/lib/mysql' &

until mysqladmin ping >/dev/null 2>&1; do
    echo "Waiting for MariaDB to start..."
    sleep 5
done
mariadb -u root <<EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
CREATE USER \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO \`$MYSQL_USER\`@'%' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
echo "[MARIADB] Starting Mariadb...."
mysqld > /dev/null 2>&1