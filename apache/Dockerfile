FROM ubuntu:17.10
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils

# Install dep
RUN apt-get install -y apache2
RUN apt-get install -y php7.1
RUN apt-get install -y libapache2-mod-php7.1
RUN apt-get install -y php7.1-bcmath
RUN apt-get install -y php7.1-cli
RUN apt-get install -y php7.1-common
RUN apt-get install -y php7.1-curl
RUN apt-get install -y php7.1-dev
RUN apt-get install -y php7.1-fpm
RUN apt-get install -y php7.1-intl
RUN apt-get install -y php7.1-json
RUN apt-get install -y php7.1-mbstring
RUN apt-get install -y php7.1-mysql
RUN apt-get install -y php7.1-opcache
RUN apt-get install -y php7.1-readline
RUN apt-get install -y php7.1-xml
RUN apt-get install -y php7.1-zip
RUN apt-get install -y php-common
RUN apt-get install -y php-imagick


# Configure Apache
RUN mkdir /var/www/app
RUN rm -rf /etc/apache2/sites-available/* && rm -rf /etc/apache2/sites-enabled/*
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
ADD app.conf /etc/apache2/sites-available/app.conf

RUN a2ensite app
RUN a2enmod headers
RUN a2enmod deflate
RUN a2enmod rewrite
# RUN service apache2 restart

WORKDIR /var/www/app

RUN usermod -u 1000 www-data

/usr/sbin/apache2
EXPOSE 80

ENV DEBIAN_FRONTEND teletype
