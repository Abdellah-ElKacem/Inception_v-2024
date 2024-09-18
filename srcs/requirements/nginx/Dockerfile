FROM debian:bullseye

RUN apt-get update -y && apt-get install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN mkdir -p /var/run/nginx 

COPY /conf/nginx.conf etc/nginx/sites-available/default

RUN chmod 755 /var/www/html

RUN openssl req -x509 -nodes -days 365 -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/L=KH/O=1337/OU=student/CN=ael-kace@42.ma/UID=ael-kace"

CMD ["nginx", "-g", "daemon off;"]