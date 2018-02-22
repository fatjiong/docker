FROM php:7.0.24-fpm

RUN docker-php-ext-enable opcache
RUN apt-get update \
  && apt-get install -y --no-install-recommends libpq-dev libpng-dev libjpeg-dev libfreetype6-dev libmcrypt-dev libpng12-dev \
  && docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-freetype-dir=/usr/include/freetype2 \
        --with-png-dir=/usr/include \
        --with-jpeg-dir=/usr/include \
  && docker-php-ext-install mysqli pdo_pgsql pdo_mysql gd zip opcache iconv mcrypt mbstring \
  && docker-php-ext-enable opcache gd \
  && pecl channel-update pecl.php.net \
  && pecl install igbinary \
  && pecl install redis \
  && pecl install swoole

COPY ./php.ini /usr/local/etc/php/conf.d/