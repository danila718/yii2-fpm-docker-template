FROM php:7.4.21-fpm

ENV DEBIAN_FRONTEND noninteractive

ARG TZ="Europe/Moscow"
ARG MODE="production"

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime

# Script for easy installation of PHP extensions recommended for (Yii 2)
COPY --from=mlocati/php-extension-installer:latest /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions \
    pdo_pgsql \
    bcmath \
    pgsql \
    intl \
    gd \
    zip \
    soap \
    gmp \
    exif \
    memcached \
    xdebug

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-$MODE" "$PHP_INI_DIR/php.ini"

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Application environment
WORKDIR /app

RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www
RUN chown -R www:www .

USER www

RUN mkdir /home/www/.composer

ENV DEBIAN_FRONTEND teletype
