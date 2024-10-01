FROM alpine:3.19

RUN apk update && apk upgrade && apk add --no-cache \ 
    php81 php81-fpm php81-mysqli \
    php81-json php81-phar php81-session \ 
    php81-curl php81-mbstring mariadb-client \
    php81-tokenizer curl

RUN ln -s /usr/bin/php81 /usr/bin/php

### PHP-FPM Configuration
RUN mkdir -p /var/www/html

COPY www.conf /etc/php81/php-fpm.d/.
COPY ./wp_entry.sh /usr/local/bin/.

RUN chmod +x /usr/local/bin/wp_entry.sh
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

### Wordpress Installation
WORKDIR /var/www/html

CMD ["/usr/local/bin/wp_entry.sh"]