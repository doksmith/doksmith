FROM php:8.3-fpm-alpine3.20

LABEL maintainer="dyzulk <https://github.com/dyzulk>"
LABEL org.opencontainers.image.title="Flarum"
LABEL org.opencontainers.image.description="Simple, fast, and modern open-source forum software packaged for Docker"
LABEL org.opencontainers.image.source="https://github.com/dyzulk-lab/docker-images"
LABEL org.opencontainers.image.url="https://flarum.org"
LABEL org.opencontainers.image.vendor="dyzulk-lab"
LABEL org.opencontainers.image.licenses="MIT"

ENV PUID=1000 \
    PGID=1000 \
    TZ=UTC \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/tmp/composer

# Install system dependencies, Nginx, Supervisor, and tools
RUN apk add --no-cache \
        bash \
        curl \
        freetype-dev \
        icu-data-full \
        icu-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libzip-dev \
        nginx \
        shadow \
        su-exec \
        supervisor \
        tzdata \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        exif \
        gd \
        intl \
        opcache \
        pdo_mysql \
        zip \
    && rm -rf /var/cache/apk/* /tmp/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Create flarum user and setup directories
RUN addgroup -g 1000 flarum \
    && adduser -D -u 1000 -G flarum -s /bin/bash -h /data flarum \
    && mkdir -p /data /run/nginx /var/log/supervisor /etc/supervisor.d

# Copy filesystem configuration
COPY rootfs/ /

RUN chmod +x /entrypoint.sh

WORKDIR /data
EXPOSE 8000
VOLUME ["/data"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["supervisord", "-c", "/etc/supervisor.d/supervisord.conf"]
