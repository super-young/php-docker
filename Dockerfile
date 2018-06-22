FROM php:7.2-fpm
RUN apt-get update
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        mcrypt 
RUN apt-get install  -y libcurl4-gnutls-dev 
RUN apt-get install -y libxml2-dev
RUN docker-php-ext-install -j$(nproc) iconv mysqli opcache \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) curl \
    && docker-php-ext-install -j$(nproc) xml \
    && docker-php-ext-install -j$(nproc) zip

CMD [ "php-fpm" ]