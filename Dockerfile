FROM php:7.2.1-apache

MAINTAINER Pierre-Henri Bourdeau

# Debian dep
RUN apt-get update
RUN apt-get install -y vim git libzip-dev zlib1g-dev zip unzip

# Install php extensions
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install pdo pdo_mysql zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Bashrc
RUN rm /root/.bashrc
COPY php-7.2/.bashrc /root/.bashrc

# Cleaning
RUN rm -rf /etc/apache2/sites-available/* && rm -rf /etc/apache2/sites-enabled/*
RUN service apache2 restart
RUN rm -rf /var/www/*

# Conf Apache2
RUN mkdir /var/www/app
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY php-7.2/app.conf /etc/apache2/sites-available/app.conf
RUN usermod -u 1000 www-data
RUN a2ensite app.conf
RUN service apache2 restart

WORKDIR /var/www/app

ARG APP_ENV=prod
ENV COMPOSER_ALLOW_SUPERUSER=1

# prevent the reinstallation of vendors at every changes in the source code
COPY composer.json composer.lock ./
RUN set -eux; \
	composer install --prefer-dist --no-dev --no-autoloader --no-scripts --no-progress --no-suggest; \
	composer clear-cache

COPY . ./

RUN set -eux; \
	mkdir -p var/cache var/log; \
	composer dump-autoload --classmap-authoritative --no-dev; \
	composer run-script --no-dev post-install-cmd; \
	chmod +x bin/console; sync

VOLUME /var/www/app/vendor

EXPOSE 80
