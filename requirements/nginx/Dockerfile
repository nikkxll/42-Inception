FROM alpine:3.19

RUN apk update && apk upgrade && apk add --no-cache nginx

COPY default.conf /etc/nginx/http.d/.

CMD ["nginx", "-g", "daemon off;"]