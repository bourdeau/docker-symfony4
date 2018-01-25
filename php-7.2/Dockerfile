FROM php:7.2.1-apache

MAINTAINER Pierre-Henri Bourdeau

# Install php extensions
RUN docker-php-ext-install pdo pdo_mysql

# Cleaning
RUN rm -rf /etc/apache2/sites-available/* && rm -rf /etc/apache2/sites-enabled/*
RUN rm -rf /var/www/*

# Conf Apache2
RUN mkdir /var/www/app
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
ADD app.conf /etc/apache2/sites-available/app.conf
RUN usermod -u 1000 www-data
RUN a2ensite app.conf
RUN service apache2 restart

WORKDIR /var/www/app


EXPOSE 80
