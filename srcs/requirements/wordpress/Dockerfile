FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt-get install -y php7.4 php-fpm php-mysql mariadb-client curl wget

COPY ./conf/php-config.sh /

RUN mkdir -p /run/php/ && chmod +x /run/php/

RUN chmod +x /php-config.sh

RUN echo "listen=0.0.0.0:9000" >> /etc/php/7.4/fpm/php-fpm.conf

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O 

RUN cp /wp-cli.phar /usr/local/bin/wp

RUN chmod +x /usr/local/bin/wp

CMD ["/php-config.sh"] 