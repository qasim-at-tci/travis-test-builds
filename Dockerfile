FROM php:8.3.0-fpm-alpine
RUN apk add --update --no-cache apache2 apache2-proxy apache2-ctl autoconf curl exiftool gcc g++ make zlib-dev build-base gettext-dev gettext-dev icu-dev libmcrypt-dev libmemcached libmemcached-dev librdkafka librdkafka-dev libpng-dev libssh2-dev libxml2-dev libzip-dev oniguruma-dev linux-headers memcached py-pip python3 python3-dev rabbitmq-c-dev unzip
RUN pip install supervisor==4.2.4 --break-system-packages
RUN pecl update-channels
RUN pecl -q install grpc-1.59.1
