FROM alpine:3.8

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --upgrade \
	imagemagick \
	libxml2 \
	php5-apcu \
	php5-bz2 \
	php5-ctype \
	php5-curl \
	php5-dom \
	php5-exif \
    php5-json \
	php5-ftp \
	php5-gd \
	php5-gmp \
	php5-iconv \
	php5-imap \
	php5-intl \
	php5-ldap \
	php5-mcrypt \
	php5-opcache \
	php5-pcntl \
	php5-pdo_mysql \
	php5-pdo_pgsql \
	php5-pdo_sqlite \
	php5-pgsql \
	php5-phar \
    php5-phpdbg \
    php5-posix \
	php5-sqlite3 \
    php5-xml \
	php5-xmlreader \
	php5-zip && \
 echo "**** configure php ****" && \
 echo "**** cleanup ****" && \
rm -rf /tmp/*

EXPOSE 9000
CMD ["php-fpm"]
