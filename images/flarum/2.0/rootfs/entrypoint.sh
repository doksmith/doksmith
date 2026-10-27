#!/bin/bash
set -e

PUID=${PUID:-1000}
PGID=${PGID:-1000}

# Update user & group ID if requested
groupmod -o -g "$PGID" flarum >/dev/null 2>&1 || true
usermod -o -u "$PUID" -g "$PGID" flarum >/dev/null 2>&1 || true

# Timezone configuration
if [ -n "$TZ" ]; then
    ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime && echo "$TZ" > /etc/timezone
fi

# Ensure data directories exist
mkdir -p /data/public /data/storage /data/extensions
chown -R flarum:flarum /data /var/log/nginx /var/lib/nginx /run

# Initial install if Flarum is not yet installed in /data
if [ ! -f /data/flarum ] && [ ! -f /data/composer.json ]; then
    echo ">> Initializing Flarum installation in /data..."
    su-exec flarum composer create-project flarum/flarum:^2.0 /data --stability=stable --prefer-dist --no-interaction
fi

# Set proper ownership
chown -R flarum:flarum /data

echo ">> Starting application..."
exec "$@"
