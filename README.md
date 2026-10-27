# Doksmith Image Template (`doksmith/doksmith`)

Official template repository for creating production-ready, multi-architecture Docker container images for the [Doksmith](https://github.com/doksmith) community.

---

## 🚀 How to Create a New Container Image

1. Click the green **"Use this template"** button above to create a new repository under `@doksmith`.
2. Follow the standard repository naming format: `docker-<app>` (e.g. `docker-redis`, `docker-wordpress`).
3. Use the helper script to scaffold a new image version:
   ```bash
   ./tools/new-image.sh <image-name> <version>
   # Example: ./tools/new-image.sh redis 7.2
   ```
4. Define your `Dockerfile`, `build.json`, and filesystem overlays in `rootfs/`.
5. The repository uses the shared organization workflow from `doksmith/.github` for automated multi-arch building (`linux/amd64`, `linux/arm64`) and publishing to GitHub Container Registry (`ghcr.io/doksmith/<image>`).

---

## 🛡️ Doksmith Container Standards

- **Minimal Base**: Powered by Alpine Linux.
- **Fast Builds**: Use native pre-compiled packages (zero GCC compilation overhead).
- **Security-First**: CVE mitigated runtimes (PHP 8.3 LTS, non-root execution where applicable).
- **Independent Repositories**: Modular `docker-<app>` repositories ensure isolated issue tracking and dedicated documentation per container.
