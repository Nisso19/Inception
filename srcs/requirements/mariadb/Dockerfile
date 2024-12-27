FROM debian:bullseye
RUN apt update -y && apt upgrade -y && apt install mariadb-server -y
RUN mkdir -p /var/run/mysqld \
    && chmod +x /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld
COPY conf/50-server.cnf /etc/mysql/mariadb.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadbscript.sh /usr/local/bin
RUN chmod +x /usr/local/bin/mariadbscript.sh
RUN chmod -R 770 /var/lib/mysql
RUN chgrp -R mysql /var/lib/mysql
USER root
EXPOSE 3306
ENTRYPOINT [ "bash", "/usr/local/bin/mariadbscript.sh" ]
