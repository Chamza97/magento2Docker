FROM php:7.3-fpm

##install xdebug
#RUN pecl install xdebug \
#  && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)\n" >> /usr/local/etc/php/conf.d/xdebug.ini

#install libs
RUN apt-get update \
  && apt-get install -y \
    cron \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxslt1-dev \
    libzip-dev \
    mariadb-client

RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN apt-get -y install gcc make autoconf libc-dev pkg-config \
   && apt-get -y install libmcrypt-dev \
   && pecl install mcrypt-1.0.2

RUN docker-php-ext-install \
  bcmath \
  gd \
  intl \
  mbstring \
  pdo_mysql \
  soap \
  xsl \
  zip

#install composer
RUN curl https://getcomposer.org/installer  \
   | php -- --filename=composer --install-dir=/bin

#setup user access
RUN usermod -u 1000 www-data
