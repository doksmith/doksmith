# Flarum Container Image

Production-ready, multi-architecture container image for [Flarum](https://flarum.org), built on top of Alpine 3.20 Linux with pre-compiled PHP 8.3, Nginx, and Supervisor. Maintained by [doksmith](https://github.com/doksmith).

## Supported Tags

- `2.0.2`, `2.0`, `2`, `latest`

## Quick Start

```yaml
services:
  flarum:
    image: ghcr.io/doksmith/flarum:2.0.2
    restart: always
    ports:
      - "8000:8000"
    environment:
      - TZ=Asia/Jakarta
      - PUID=1000
      - PGID=1000
      - DB_HOST=mysql
      - DB_NAME=flarum
      - DB_USER=flarum
      - DB_PASSWORD=secret
      - FLARUM_BASE_URL=http://localhost:8000
    volumes:
      - ./data:/data
```

## Volumes

- `/data`: Website root directory containing composer configuration, extensions, assets, and storage.
