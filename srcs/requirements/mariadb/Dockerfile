#FROM debian:bullseye
#RUN apt update -y && apt upgrade -y && apt install -y mariadb-server mariadb-client
#RUN mkdir -p /var/run/mysqld \
#    && chmod +x /var/run/mysqld \
#    && chown -R mysql:mysql /var/run/mysqld \
#    && chmod 777 /var/run/mysqld
#EXPOSE 3306
#COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY tools/mariadbscript.sh /usr/local/bin
#RUN chmod +x /usr/local/bin/mariadbscript.sh
#ENTRYPOINT [ "/usr/local/bin/mariadbscript.sh" ]
#CMD ["mysqld", "--bind-address=0.0.0.0"]

FROM debian:bullseye
# bullseye is the codename for Debian 11

RUN echo "Dockerfile running for mariadb"

RUN apt update && apt upgrade -y

RUN apt install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld \
    && chmod +x /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/50-server.cnf

# use preset wordpress.sql, no wordpress template
# COPY ./tools/wordpress.sql /usr/local/bin

COPY ./tools/mariadbscript.sh /usr/local/bin

RUN chmod +x /usr/local/bin/mariadbscript.sh

ENTRYPOINT [ "/usr/local/bin/mariadbscript.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]
