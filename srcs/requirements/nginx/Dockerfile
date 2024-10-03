FROM alpine:3.19

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/dnikifor.42.fr.key \
    -out /etc/nginx/ssl/dnikifor.42.fr.crt \
    -subj "/CN=dnikifor.42.fr"

COPY ./config/default.conf /etc/nginx/http.d/.

CMD ["nginx", "-g", "daemon off;"]