FROM php:7.3-fpm-alpine
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN \
 set -eux; \
    apk update; apk upgrade; docker-php-source extract;\
    apk add --no-cache --virtual .build-dependencies \
        $PHPIZE_DEPS \
        zlib-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        icu-dev \
        autoconf \
        libtool \
        pcre-dev \
        imagemagick-dev \
        g++ \
        make; \
    apk add --no-cache \
        gettext \
        tini \
        libintl \
        icu \
        icu-dev \
        libxml2-dev \
        php-soap \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        gmp \
        gmp-dev \
        libmemcached-dev \
        imagemagick-dev \
        libssh2 \
        libssh2-dev \
        libxslt-dev \
        zip \
        libzip-dev \
        unzip; \
    pecl install -o -f imagick redis igbinary apcu; \
    pecl clear-cache; \
    docker-php-ext-enable redis.so imagick; \
    apk add --no-cache icu-libs && \
      apk add --no-cache --virtual build-dependencies && \
      NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    docker-php-ext-install -j${NPROC} gd; \
    docker-php-ext-install -j${NPROC} zip; \
    docker-php-ext-install -j${NPROC} intl; \
    docker-php-ext-install -j${NPROC} pdo; \
    docker-php-ext-install -j${NPROC} opcache; \
    docker-php-ext-install -j${NPROC} mbstring; \
    docker-php-ext-install -j${NPROC} fileinfo; \
    docker-php-ext-install -j${NPROC} mysqli; \
    docker-php-ext-install -j${NPROC} json; \
    docker-php-ext-install -j${NPROC} pdo_mysql; \
    docker-php-ext-install -j${NPROC} bcmath; \
    docker-php-ext-install -j${NPROC} exif; \
    apk del --no-cache --purge build-dependencies;

RUN \
 echo "**** configure php ****"; \
 mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"; \
 echo "memory_limit=512M" > $PHP_INI_DIR/conf.d/90-php.ini; \
 echo "extension=apcu.so" >> $PHP_INI_DIR/conf.d/90-php.ini; \
 echo "post_max_size=80M" >> $PHP_INI_DIR/conf.d/90-php.ini; \
 echo "upload_max_filesize=60M" >> $PHP_INI_DIR/conf.d/90-php.ini; \
 rm -rf /tmp/* /var/cache/apk/*
