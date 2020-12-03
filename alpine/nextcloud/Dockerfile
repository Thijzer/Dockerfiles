FROM thijs/php:alpine-php-7.4-nginx

# set version label
ARG BUILD_DATE
ARG VERSION
ARG NEXTCLOUD_RELEASE

# environment settings
ENV NEXTCLOUD_PATH="/config/www/nextcloud"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies --upgrade \
	autoconf \
	automake \
	file \
	g++ \
	gcc \
	make \
	tar \
	re2c \
	samba-dev \
	zlib-dev && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --upgrade \
	curl \
	ffmpeg \
	samba-client \
	unzip && \
pecl install smbclient && \
echo "extension=smbclient.so" > /php/conf.d/smbclient.ini && \
 echo "**** set version tag ****" && \
 if [ -z ${NEXTCLOUD_RELEASE+x} ]; then \
 	NEXTCLOUD_RELEASE=$(curl -s https://download.nextcloud.com/server/installer/setup-nextcloud.php \
	| awk -F \' '/NC_VERSION/{print $4;exit}); \
 fi && \
 echo ${NEXTCLOUD_RELEASE} > /version.txt && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies tar unzip curl && \
 rm -rf \
	/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config /data