service php7.4-fpm start
cd /var/www/wordpress
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
	       	--dbhost='mariadb' \
		--path='/var/www/wordpress'

	if [ ! -f /var/www/wordpress/wp-config.php ]; then
		echo "wp-config.php n'est pas creer"
	else
	echo "[WORDPRESS] Database Check"
	until wp db check --allow-root &>/dev/null; do	
		echo "[WORDPRESS] Waiting for MariaDB to be ready..."
		sleep 5
	done
	echo "[WORDPRESS] Installing wordpress.."
	wp core install --allow-root \
		--url='yaainouc.42.fr' \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASSWORD \
		--path='/var/www/wordpress' \
		--admin_email=$WP_ADMIN_EMAIL
    	wp user create $WP_USER \
		$WP_USER_EMAIL \
		--role=author \
		--user_pass=$WP_USER_PASS \
		--allow-root \
		--path='/var/www/wordpress'
	fi
fi
service php7.4-fpm stop
echo -e "[WORDPRESS] Starting php fpm..."
exec php-fpm7.4 -F
echo -e "[WORDPRESS] Php fpm successfully started"
