FROM alpine:3.20

LABEL maintainer="doksmith <https://github.com/doksmith>"
LABEL org.opencontainers.image.title="Flarum"
LABEL org.opencontainers.image.description="Simple, fast, and modern open-source forum software packaged for Docker"
LABEL org.opencontainers.image.source="https://github.com/doksmith/doksmith"
LABEL org.opencontainers.image.url="https://flarum.org"
LABEL org.opencontainers.image.vendor="doksmith"
LABEL org.opencontainers.image.licenses="MIT"

ENV PUID=1000 \
    PGID=1000 \
    TZ=UTC \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/tmp/composer

# Install pre-compiled PHP 8.3 binary packages (Instant install, NO GCC / NO QEMU compilation overhead)
RUN apk add --no-cache \
        bash \
        curl \
        nginx \
        shadow \
        su-exec \
        supervisor \
        tzdata \
        php83 \
        php83-fpm \
        php83-bcmath \
        php83-ctype \
        php83-curl \
        php83-dom \
        php83-exif \
        php83-fileinfo \
        php83-gd \
        php83-iconv \
        php83-intl \
        php83-mbstring \
        php83-opcache \
        php83-openssl \
        php83-pdo_mysql \
        php83-session \
        php83-simplexml \
        php83-tokenizer \
        php83-xml \
        php83-xmlwriter \
        php83-zip \
        php83-zlib \
    && ln -sf /usr/bin/php83 /usr/bin/php \
    && ln -sf /usr/sbin/php-fpm83 /usr/sbin/php-fpm

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Setup user flarum & necessary directories
RUN addgroup -g 1000 flarum \
    && adduser -D -u 1000 -G flarum -s /bin/bash -h /data flarum \
    && mkdir -p /data /run/nginx /run/php /var/log/supervisor /etc/supervisor.d

# Copy filesystem configuration
COPY rootfs/ /

RUN chmod +x /entrypoint.sh

WORKDIR /data
EXPOSE 8000
VOLUME ["/data"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["supervisord", "-c", "/etc/supervisor.d/supervisord.conf"]
