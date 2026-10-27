# Doksmith Container Images (`doksmith`)

Production-ready, multi-architecture (`linux/amd64`, `linux/arm64`) container images maintained by [doksmith](https://github.com/doksmith).

## Architecture & Features

- **Multi-Architecture**: Built natively for `linux/amd64` and `linux/arm64` via Docker Buildx & QEMU.
- **Fast Builds (Zero Compilation Overhead)**: Leveraging Alpine Linux native pre-compiled binaries to ensure multi-arch builds finish in under 1 minute.
- **CVE Mitigated**: Strict adherence to security patches, using PHP 8.3 LTS to eliminate PHP 8.2 end-of-life and PHP2Shell vulnerabilities.
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
│       ├── 1.8/                    # Flarum 1.x LTS series (v1.8.21)
│       │   ├── Dockerfile
│       │   ├── build.json
│       │   └── rootfs/
│       └── 2.0/                    # Flarum 2.x Latest series (v2.0.2)
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
| **Flarum 2.x** | `2.0.2`, `2.0`, `2`, `latest` | `amd64`, `arm64` | `ghcr.io/doksmith/flarum` | Fast, modern open-source forum software (Latest Stable) |
| **Flarum 1.x** | `1.8.21`, `1.8`, `1` | `amd64`, `arm64` | `ghcr.io/doksmith/flarum` | Legacy forum software series (LTS / Maintenance) |

---

## Local Development

### Build an Image Locally

```bash
# Build Flarum 2.x
docker buildx build \
  --platform linux/amd64 \
  -t ghcr.io/doksmith/flarum:2.0.2 \
  -f images/flarum/2.0/Dockerfile \
  images/flarum/2.0/

# Build Flarum 1.x LTS
docker buildx build \
  --platform linux/amd64 \
  -t ghcr.io/doksmith/flarum:1.8.21 \
  -f images/flarum/1.8/Dockerfile \
  images/flarum/1.8/
```

### Adding a New Image

1. Run `./tools/new-image.sh <app-name> <version>`.
2. Populate `Dockerfile`, `build.json`, and supporting files (`rootfs/`).
3. Commit and push to `main` branch. The CI pipeline will automatically test, build, and publish the image to `ghcr.io/doksmith/<app-name>`.
