FROM php:7.3-cli-alpine

ENV PHP_REDIS_VERSION 5.0.2
# persistent / runtime deps
ENV PHPIZE_DEPS \
    autoconf \
    cmake \
    file \
    g++ \
    gcc \
    libc-dev \
    pcre-dev \
    make \
    git \
    pkgconf \
    re2c

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS

RUN git clone --branch ${PHP_REDIS_VERSION} https://github.com/phpredis/phpredis /tmp/phpredis \
    && cd /tmp/phpredis \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && make test
COPY config/redis.ini /usr/local/etc/php/conf.d/

RUN apk del .build-deps \
    && rm -rf /tmp/* \
    && rm -rf /app \
    && mkdir /app

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --virtual .persistent-deps \
	imagemagick \
	libxml2 \
	php7-apcu \
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
	php7-redis \
    php7-session \
	php7-sodium \
	php7-sqlite3 \
	php7-tokenizer \
	php7-xmlwriter \
	php7-simplexml \
    php7-xml \
	php7-xmlreader \
	php7-zip && \
 echo "**** configure php ****" && \
 echo 'apc.enable_cli=1' >> /etc/php7/conf.d/apcu.ini && \
 sed -i \
	-e 's/;opcache.enable.*=.*/opcache.enable=1/g' \
	-e 's/;opcache.interned_strings_buffer.*=.*/opcache.interned_strings_buffer=8/g' \
	-e 's/;opcache.max_accelerated_files.*=.*/opcache.max_accelerated_files=10000/g' \
	-e 's/;opcache.memory_consumption.*=.*/opcache.memory_consumption=128/g' \
	-e 's/;opcache.save_comments.*=.*/opcache.save_comments=1/g' \
	-e 's/;opcache.revalidate_freq.*=.*/opcache.revalidate_freq=1/g' \
	-e 's/;always_populate_raw_post_data.*=.*/always_populate_raw_post_data=-1/g' \
	-e 's/memory_limit.*=.*128M/memory_limit=512M/g' \
		/etc/php7/php.ini && \
 sed -i \
	'/opcache.enable=1/a opcache.enable_cli=1' \
		/etc/php7/php.ini && \
 echo "env[PATH] = /usr/local/bin:/usr/bin:/bin" >> /etc/php7/php-fpm.conf && \
 echo "**** cleanup ****" && \
rm -rf /tmp/*

VOLUME ["/app"]
WORKDIR /app