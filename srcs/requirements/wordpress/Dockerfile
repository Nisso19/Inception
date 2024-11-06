FROM debian:bullseye

RUN apt-get -y update && apt-get install -y \
    php-fpm tar wget php-mysqli php-redis mariadb-client \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY tools/start_setup.sh start_setup.sh
RUN chmod +x start_setup.sh
RUN mkdir -p /run/php
RUN mkdir -p /var/www/html
RUN rm -rf /var/www/html/*
#RUN cd tmp
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["bash", "/start_setup.sh"]

#RUN apt install -y php7.4 php-fpm php-mysql mariadb-client
#RUN wget https://fr.wordpress.org/wordpress-6.6.1-fr_FR.tar.gz -P /var/www
#RUN cd /var/www && tar -xzf wordpress-6.6.1-fr_FR.tar.gz && rm wordpress-6.6.1-fr_FR.tar.gz
#RUN chown -R root:root /var/www/wordpress
#COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
#RUN wget  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp
#COPY tools/start_setup.sh /start_setup.sh
#copy conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
#RUN chmod 777 /start_setup.sh
#ENTRYPOINT ["bash", "/start_setup.sh"]
