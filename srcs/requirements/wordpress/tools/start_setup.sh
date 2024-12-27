sleep 5
service php7.4-fpm start
cd /var/www/wordpress
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp core download --path='/var/www/wordpress' --allow-root
    	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
	       	--dbhost='mariadb' \
		--path='/var/www/wordpress'
	until wp db check --allow-root &>/dev/null; do	
		echo "[WORDPRESS] Waiting for MariaDB to be ready..."
		sleep 5
	done
	echo "[WORDPRESS] Installing wordpress.."
	wp core install --allow-root \
		--url=$WP_SITE \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASSWORD \
		--path='/var/www/wordpress' \
		--admin_email=$WP_ADMIN_EMAIL
    wp user create $WP_USER \
		$WP_USER_EMAIL \
		--role=author \
		--user_pass=$WP_USER_PASSWORD \
		--allow-root \
		--path='/var/www/wordpress'
else
	echo "[WORDPRESS] wp-config.php already created."

fi
service php7.4-fpm stop
echo -e "[WORDPRESS] Starting php fpm..."
exec php-fpm7.4 -F
echo -e "[WORDPRESS] Php fpm successfully started"
