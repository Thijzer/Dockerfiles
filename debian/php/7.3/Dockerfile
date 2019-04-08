FROM debian:stretch-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    echo "**** install addition packages ****" && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        apt-transport-https \
        lsb-release \
        ca-certificates \
        bash-completion \
        gnupg \
        procps \
        ssh-client \
        sudo \
        wget && \
        echo "**** install runtime packages ****" && \
        wget -O sury.gpg https://packages.sury.org/php/apt.gpg && apt-key add sury.gpg && rm sury.gpg && \
        echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.3.list && \
        echo "**** install runtime packages ****" && \
    apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        imagemagick \
        mysql-client \
        php7.3-cli \
        php7.3-fpm \
        php7.3-apcu \
        php7.3-mbstring \
        php7.3-curl \
        php7.3-gd \
        php7.3-imagick \
        php7.3-intl \
        php7.3-bcmath \
        php7.3-mysql \
        php7.3-xdebug \
        php7.3-xml \
        php7.3-zip \
        php7.3-ldap && \
 echo "**** configure php ****" && \
 phpdismod xdebug && \
 mkdir -p /run/php && sed -i "s/listen = .*/listen = 9000/" /etc/php/7.3/fpm/pool.d/www.conf && \
 sed -i \
	-e 's/;opcache.enable.*=.*/opcache.enable=1/g' \
	-e 's/;opcache.interned_strings_buffer.*=.*/opcache.interned_strings_buffer=8/g' \
	-e 's/;opcache.max_accelerated_files.*=.*/opcache.max_accelerated_files=10000/g' \
	-e 's/;opcache.memory_consumption.*=.*/opcache.memory_consumption=128/g' \
	-e 's/;opcache.save_comments.*=.*/opcache.save_comments=1/g' \
	-e 's/;opcache.revalidate_freq.*=.*/opcache.revalidate_freq=1/g' \
	-e 's/;always_populate_raw_post_data.*=.*/always_populate_raw_post_data=-1/g' \
	-e 's/memory_limit.*=.*128M/memory_limit=512M/g' \
		/etc/php/7.3/cli/php.ini && \
 sed -i \
	'/opcache.enable=1/a opcache.enable_cli=1' \
		/etc/php/7.3/cli/php.ini && \
 echo "env[PATH] = /usr/local/bin:/usr/bin:/bin" >> /etc/php/7.3/fpm/php-fpm.conf && \ 
 echo "**** cleanup ****" && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Copy "entrypoint"
COPY ./entrypoint.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/entrypoint.sh

EXPOSE 9000

# Run FPM in foreground
#CMD ["sudo", "php-fpm7.3", "-F"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]