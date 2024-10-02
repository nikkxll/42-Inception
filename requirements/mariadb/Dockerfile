FROM alpine:3.19

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

COPY mariadb-server.cnf /etc/my.cnf.d/.
COPY init.sql /docker-entrypoint-initdb.d/init.sql
COPY entry.sh /usr/local/bin/entry.sh

RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql && \
    chmod +x /usr/local/bin/entry.sh

ENTRYPOINT ["/usr/local/bin/entry.sh"]