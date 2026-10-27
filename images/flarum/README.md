# Flarum Container Image

Production-ready, multi-architecture container images for [Flarum](https://flarum.org), built on top of Alpine 3.20 Linux with pre-compiled PHP 8.3 (CVE-hardened), Nginx, and Supervisor. Maintained by [doksmith](https://github.com/doksmith).

## Supported Series & Tags

| Series | Documentation | Image Tags | Recommended Runtime | Status |
|---|---|---|---|---|
| **Flarum 2.x** | [docs.flarum.org](https://docs.flarum.org) | `2.0.2`, `2.0`, `2`, `latest` | PHP 8.3 Patched | Latest Stable |
| **Flarum 1.x** | [docs.flarum.org/1.x/](https://docs.flarum.org/1.x/) | `1.8.21`, `1.8`, `1` | PHP 8.3 Patched | LTS / Maintenance |

## Quick Start

### Flarum 2.x (Latest)
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

### Flarum 1.x (LTS)
```yaml
services:
  flarum:
    image: ghcr.io/doksmith/flarum:1.8.21
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
