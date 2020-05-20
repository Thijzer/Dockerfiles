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
 echo 'apc.enable_cli=1' >> $PHP_INI_DIR/conf.d/apcu.ini && \
 sed -i \
	-e 's/;opcache.enable.*=.*/opcache.enable=1/g' \
	-e 's/;opcache.interned_strings_buffer.*=.*/opcache.interned_strings_buffer=8/g' \
	-e 's/;opcache.max_accelerated_files.*=.*/opcache.max_accelerated_files=10000/g' \
	-e 's/;opcache.memory_consumption.*=.*/opcache.memory_consumption=128/g' \
	-e 's/;opcache.save_comments.*=.*/opcache.save_comments=1/g' \
	-e 's/;opcache.revalidate_freq.*=.*/opcache.revalidate_freq=1/g' \
	-e 's/;always_populate_raw_post_data.*=.*/always_populate_raw_post_data=-1/g' \
	-e 's/memory_limit.*=.*128M/memory_limit=512M/g' \
		$PHP_INI_DIR/conf.d/app.ini && \
 echo "**** cleanup ****" && \
 rm -rf /tmp/*

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer 

EXPOSE 9000

CMD ["php-fpm"]
