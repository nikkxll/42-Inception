FROM alpine:3.19

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

COPY ./config/mariadb-server.cnf /etc/my.cnf.d/. 
COPY ./tools/entry.sh /usr/local/bin/entry.sh

RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql && \
    chmod +x /usr/local/bin/entry.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entry.sh"]