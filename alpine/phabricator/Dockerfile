FROM thijs/php:alpine-php-7.4-nginx

# set version label
#ARG BUILD_DATE
#ARG VERSION
#ARG PHABRICATOR_RELEASE
#LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# environment settings
ENV PHABRICATOR_RELEASE=stable
ENV PHABRICATOR_PATH="/config/www/phabricator"

#  echo 'apc.enable_cli=1' >> /etc/php7/conf.d/apcu.ini && \
#  sed -i \
# 	-e 's/;opcache.enable.*=.*/opcache.enable=1/g' \
# 	-e 's/;opcache.interned_strings_buffer.*=.*/opcache.interned_strings_buffer=8/g' \
# 	-e 's/;opcache.max_accelerated_files.*=.*/opcache.max_accelerated_files=10000/g' \
# 	-e 's/;opcache.memory_consumption.*=.*/opcache.memory_consumption=128/g' \
# 	-e 's/;opcache.save_comments.*=.*/opcache.save_comments=1/g' \
# 	-e 's/;opcache.revalidate_freq.*=.*/opcache.revalidate_freq=1/g' \
# 	-e 's/;always_populate_raw_post_data.*=.*/always_populate_raw_post_data=-1/g' \
# 	-e 's/memory_limit.*=.*128M/memory_limit=512M/g' \
# 	-e 's/max_execution_time.*=.*30/max_execution_time=120/g' \
# 	-e 's/upload_max_filesize.*=.*2M/upload_max_filesize=1024M/g' \
# 	-e 's/post_max_size.*=.*8M/post_max_size=1024M/g' \
# 		/etc/php7/php.ini && \
#  sed -i \
# 	'/opcache.enable=1/a opcache.enable_cli=1' \
# 		/etc/php7/php.ini && \
#  echo "env[PATH] = /usr/local/bin:/usr/bin:/bin" >> /etc/php7/php-fpm.conf && \

RUN \
 echo "**** download phabricator + dependencies ****" && \
 mkdir -p /app && \
 curl -o /tmp/phabricator.zip -L \
	https://github.com/phacility/phabricator/archive/${PHABRICATOR_RELEASE}.zip && \
	unzip -q /tmp/phabricator.zip -d /app && mv /app/phabricator-${PHABRICATOR_RELEASE} /app/phabricator && \
 curl -o /tmp/libphutil.zip -L \
	https://github.com/phacility/libphutil/archive/${PHABRICATOR_RELEASE}.zip && \
	unzip -q /tmp/libphutil.zip -d /app && mv /app/libphutil-${PHABRICATOR_RELEASE} /app/libphutil && \
 curl -o /tmp/arcanist.zip -L \
	https://github.com/phacility/arcanist/archive/${PHABRICATOR_RELEASE}.zip && \
	unzip -q /tmp/arcanist.zip -d /app && mv /app/arcanist-${PHABRICATOR_RELEASE} /app/arcanist && \
 rm -rf \
	/tmp/*

COPY files/ /

WORKDIR /app
