FROM alpine:3.19

RUN apk update && apk upgrade && apk add --no-cache \ 
    php81 php81-fpm php81-mysqli \
    php81-json php81-session curl

COPY www.conf /etc/php81/php-fpm.d/.

CMD ["php-fpm81", "-F"]
