FROM alpine:3.19

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

COPY mariadb-server.cnf /etc/my.cnf.d/.
COPY init.sql /docker-entrypoint-initdb.d/.

RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

CMD ["mysqld", "--datadir=/var/lib/mysql", "--console"]