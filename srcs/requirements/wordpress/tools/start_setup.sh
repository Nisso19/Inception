sleep 15
service php7.4-fpm start
cd /var/www/wordpress
echo $MYSQL_DATABASE
echo $MYSQL_USER
echo $MYSQL_PASSWORD
#while ! nc -z -w2 mariadb 3306; do
#	echo "waiting for mariadb to be properly running\n"
#	sleep 2
#done
if [ ! -f /var/www/wordpress/wp-config.php ]; then

	#wp core download --path='/var/www/wordpress' --allow-root
	#./wp-cli.phar config create --allow-root \
    	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
	       	--dbhost='mariadb:3306' \
		--path='/var/www/wordpress'
		#--dbname='SQL_Inception' \
		#--dbuser='yaainouc' \
	       	#--dbpass='changeme' \
	       	#--dbhost='mariadb:3306' \
		#--path='/var/www/wordpress'
		#--skip-check \
	sleep 10
	if [ ! -f /var/www/wordpress/wp-config.php ]; then
		echo "wp-config.php n'est pas creer"
	else
	wp core install --allow-root \
		--url=$WP_SITE \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASSWORD \
		--path='/var/www/wordpress' \
		--admin_email="test@test.com" 
    	wp user create $WP_USER \
		$WP_USER_EMAIL \
		--role=author \
		--user_pass=$WP_USER_PASS \
		--allow-root \
		--path='/var/www/wordpress'
	fi
fi
echo -e "starting php fpm"
service php7.4-fpm stop
exec php-fpm7.4 -F
