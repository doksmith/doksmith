# Doksmith Container Images (`doksmith`)

Production-ready, multi-architecture (`linux/amd64`, `linux/arm64`) container images maintained by [doksmith](https://github.com/doksmith).

## Architecture & Features

- **Multi-Architecture**: Built natively for `linux/amd64` and `linux/arm64` via Docker Buildx & QEMU.
- **Fast Builds (Zero Compilation)**: Leveraging Alpine Linux native pre-compiled binaries to ensure multi-arch builds finish in under 1 minute.
- **Change Detection CI/CD**: Automatic matrix builds triggered only for image directories with changes.
- **Security-First**: Minimal base images (Alpine Linux), non-root execution where applicable, and automated vulnerability scanning.
- **Registry**: Automatically published to GitHub Container Registry (`ghcr.io/doksmith/<image>:<tag>`).

---

## Directory Layout

```text
doksmith/
├── .github/
│   └── workflows/
│       ├── build-and-publish.yml   # Build and push to GHCR on change
│       └── lint-dockerfiles.yml    # Hadolint Dockerfile linting
├── common/                         # Shared scripts, entrypoints, and configurations
├── images/                         # Catalog of container images
│   └── flarum/
│       └── 2.0/
│           ├── Dockerfile
│           ├── build.json
│           └── rootfs/
├── tools/                          # Helper scripts for development
├── docker-bake.hcl                 # Buildx bake definition
└── README.md
```

---

## Catalog

| Image | Version | Platforms | Registry | Description |
|---|---|---|---|---|
| **Flarum** | `2.0.2`, `2.0`, `2`, `latest` | `amd64`, `arm64` | `ghcr.io/doksmith/flarum` | Fast, simple, modern open-source forum software |

---

## Local Development

### Build an Image Locally

```bash
docker buildx build \
  --platform linux/amd64 \
  -t ghcr.io/doksmith/flarum:2.0.2 \
  -f images/flarum/2.0/Dockerfile \
  images/flarum/2.0/
```

### Adding a New Image

1. Run `./tools/new-image.sh <app-name> <version>`.
2. Populate `Dockerfile`, `build.json`, and supporting files (`rootfs/`).
3. Commit and push to `main` branch. The CI pipeline will automatically test, build, and publish the image to `ghcr.io/doksmith/<app-name>`.
