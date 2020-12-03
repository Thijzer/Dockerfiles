FROM alpine:3.12

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --virtual .persistent-deps \
	curl \
	ffmpeg \
	imagemagick \
	libxml2 \
	sudo \
	tar \
	php7-apcu \
	php7-bcmath \
	php7-bz2 \
	php7-ctype \
	php7-curl \
	php7-dom \
	php7-exif \
	php7-json \
	php7-fileinfo \
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
	php7-pcntl \
	php7-pdo_mysql \
	php7-pdo_pgsql \
	php7-pdo_sqlite \
	php7-pgsql \
	php7-phar \
	php7-phpdbg \
	php7-posix \
	php7-session \
	php7-redis \
	php7-sodium \
	php7-sqlite3 \
	php7-tokenizer \
	php7-xmlwriter \
	php7-simplexml \
    php7-xml \
	php7-xmlreader \
	php7-zip && \
 echo "**** configure php ****" && \
 echo 'apc.enable_cli=1' >> /etc/php7/conf.d/10-apcu.ini && \
 echo 'opcache.enable_cli=1' >> /etc/php7/conf.d/10-opcache.ini && \
 echo '{ \n\
    opcache.enable=1 \n\
    opcache.interned_strings_buffer=8 \n\
    opcache.max_accelerated_files=10000 \n\
    opcache.memory_consumption=128 \n\
    opcache.save_comments=1 \n\
    opcache.revalidate_freq=1 \n\
    always_populate_raw_post_data=-1 \n\
    memory_limit=512M \n\
}' && \
 echo "env[PATH] = /usr/local/bin:/usr/bin:/bin" >> /etc/php7/php-fpm.conf && \
 echo "**** cleanup ****" && \
 rm -rf /tmp/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer 

EXPOSE 9000
