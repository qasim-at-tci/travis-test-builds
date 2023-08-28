# php:8.2.9-fpm uses debian BOOKWORM
FROM php:8.2.9-fpm
RUN apt-get update && apt-get install -y build-essential libpq-dev libxml2-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev locales zip libzip-dev jpegoptim optipng pngquant gifsicle vim unzip git curl libonig-dev
