FROM php:7.3-fpm-alpine

ENV EXT_DEPS icu-dev autoconf g++ make

RUN \
 echo "**** installing redis ****" && \
 set -eux; \
    apk add --update icu; \
    apk add --no-cache --virtual .ext-deps ${EXT_DEPS}; \
    pecl install -o -f redis; \
    docker-php-ext-enable redis.so; \
    pecl clear-cache; \
    apk del .ext-deps;

RUN \
 echo "**** installing apcu ****" && \
 set -eux; \
    apk add --update icu; \
    apk add --no-cache --virtual .ext-deps ${EXT_DEPS}; \
    pecl install -o -f apcu; \
    pecl clear-cache; \
    apk del .ext-deps;

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --virtual .persistent-deps \
	imagemagick \
	libxml2 \
	php7-bcmath \
	php7-bz2 \
	php7-ctype \
	php7-curl \
	php7-dom \
	php7-exif \
    php7-json \
	php7-ftp \
	php7-gd \
	php7-gmp \
	php7-iconv \
	php7-imagick \
	php7-imap \
	php7-intl \
	php7-ldap \
	php7-mcrypt \
	php7-memcached \
	php7-opcache \
    php7-mbstring \
	php7-pcntl \
	php7-pdo_mysql \
	php7-pdo_pgsql \
	php7-pdo_sqlite \
	php7-pgsql \
	php7-phar \
    php7-phpdbg \
    php7-posix \
    php7-session \
	php7-sodium \
	php7-sqlite3 \
	php7-tokenizer \
	php7-xmlwriter \
	php7-simplexml \
    php7-xml \
	php7-xmlreader \
	php7-zip && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN \
 echo "**** configure php ****"; \
 echo "memory_limit=512M" > $PHP_INI_DIR/conf.d/90-php.ini; \
 echo "extension=apcu.so" >> $PHP_INI_DIR/conf.d/90-php.ini; \
 echo "post_max_size=80M" >> $PHP_INI_DIR/conf.d/90-php.ini; \
 echo "upload_max_filesize=60M" >> $PHP_INI_DIR/conf.d/90-php.ini;

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

CMD ["php-fpm"]
