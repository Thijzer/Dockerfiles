FROM debian:buster-slim

RUN \
    echo "**** install addition packages ****"; \
    echo 'APT::Install-Recommends "0" ; APT::Install-Suggests "0" ;' > /etc/apt/apt.conf.d/01-no-recommended; \
    echo 'path-exclude=/usr/share/man/*' > /etc/dpkg/dpkg.cfg.d/path_exclusions; \
    echo 'path-exclude=/usr/share/doc/*' >> /etc/dpkg/dpkg.cfg.d/path_exclusions; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        imagemagick \
        libmagickcore-6.q16-2-extra \
        ghostscript \
        php7.3-apcu \
        php7.3-bcmath \
        php7.3-cli \
        php7.3-curl \
        php7.3-fpm \
        php7.3-gd \
        php7.3-imagick \
        php7.3-intl \
        php7.3-mbstring \
        php7.3-mysql \
        php7.3-xdebug \
        php7.3-xml \
        php7.3-zip; \
        apt-get clean; apt-get --yes --quiet autoremove --purge \
    && find /var/cache/apt /var/lib/apt /var/lib/apt/lists /tmp /var/tmp -type f -delete \
    && ln -s /usr/sbin/php-fpm7.3 /usr/local/sbin/php-fpm \
    && usermod --uid 1000 www-data && groupmod --gid 1000 www-data \
    && mkdir -p /run/php /app \
    #&& chown www-data:www-data /app \
    && sed -i "s#listen = /run/php/php7.3-fpm.sock#listen = 9000#g" /etc/php/7.3/fpm/pool.d/www.conf

ADD 99-app.ini /etc/php/7.3/cli/conf.d/
ADD 99-app.ini /etc/php/7.3/fpm/conf.d/

EXPOSE 9000

VOLUME /app
WORKDIR /app

CMD [ "/usr/sbin/php-fpm7.3", "-F" ]