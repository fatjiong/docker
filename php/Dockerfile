FROM php:7.1.23-fpm

RUN apt-get update \
  && apt-get install -y --no-install-recommends libpq-dev libpng-dev libjpeg-dev libfreetype6-dev libmcrypt-dev libpng-dev libxml2-dev \
  && docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-freetype-dir=/usr/include/freetype2 \
        --with-png-dir=/usr/include \
        --with-jpeg-dir=/usr/include \
  && docker-php-ext-install mysqli pdo_pgsql pdo_mysql gd zip opcache iconv mcrypt mbstring bcmath\
  && docker-php-ext-enable opcache gd \
  && pecl channel-update pecl.php.net \
  && pecl install igbinary \
  && pecl install redis \
  && pecl install mongodb \
  && pecl install swoole
  COPY ./php.ini /usr/local/etc/php/conf.d/