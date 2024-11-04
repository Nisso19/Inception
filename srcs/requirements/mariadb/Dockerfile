FROM debian:bullseye
RUN apt update -y && apt upgrade -y && apt install -y mariadb-server mariadb-client
RUN mkdir -p /var/run/mysqld \
    && chmod +x /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld
EXPOSE 3306
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/mariadbscript.sh /usr/local/bin
RUN chmod +x /usr/local/bin/mariadbscript.sh
RUN chown mysql:mysql /var/lib/mysql
RUN chown mysql:mysql /var/lib/mysql/ib*
RUN chown mysql:mysql /var/lib/mysql/mysql/* 
RUN chown mysql:root /var/lib/mysql/mysql
RUN chown mysql:root /var/run/mysqld 
RUN chown mysql:adm /var/log/mysql
RUN chmod -R 770 /var/lib/mysql
RUN chgrp -R mysql /var/lib/mysql
ENTRYPOINT [ "bash", "/usr/local/bin/mariadbscript.sh" ]
