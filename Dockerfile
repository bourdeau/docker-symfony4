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
COPY docker/.bashrc /root/.bashrc

# Cleaning
RUN rm -rf /etc/apache2/sites-available/* && rm -rf /etc/apache2/sites-enabled/*
RUN service apache2 restart
RUN rm -rf /var/www/*

# Conf Apache2
RUN mkdir /var/www/app
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY docker/app.conf /etc/apache2/sites-available/app.conf
RUN usermod -u 1000 www-data
RUN a2ensite app.conf
RUN service apache2 restart

WORKDIR /var/www/app

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY composer.json composer.lock ./
RUN composer install --prefer-dist --no-progress --no-suggest

VOLUME /var/www/app/vendor

# EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
