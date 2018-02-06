FROM php:7.0.24-fpm

RUN docker-php-ext-enable opcache
RUN apt-get update \
  && apt-get install -y --no-install-recommends libpq-dev libpng-dev \
  && docker-php-ext-install mysqli pdo_pgsql pdo_mysql gd zip opcache iconv \
  && pecl install igbinary \
  && pecl install redis \
  && pecl install swoole

COPY ./php.ini /usr/local/etc/php/conf.d/