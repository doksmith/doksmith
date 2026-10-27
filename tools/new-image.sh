#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <image-name> <version>"
    echo "Example: $0 wordpress 7.0"
    exit 1
fi

IMAGE_NAME="$1"
VERSION="$2"
TARGET_DIR="images/${IMAGE_NAME}/${VERSION}"

if [ -d "$TARGET_DIR" ]; then
    echo "Error: Directory $TARGET_DIR already exists."
    exit 1
fi

mkdir -p "$TARGET_DIR/rootfs"

cat <<EOF > "$TARGET_DIR/build.json"
{
  "name": "${IMAGE_NAME}",
  "version": "${VERSION}",
  "platforms": [
    "linux/amd64",
    "linux/arm64"
  ],
  "tags": [
    "${VERSION}",
    "latest"
  ],
  "labels": {
    "org.opencontainers.image.title": "${IMAGE_NAME^}",
    "org.opencontainers.image.source": "https://github.com/dyzulk-lab/docker-images",
    "org.opencontainers.image.vendor": "dyzulk-lab"
  }
}
EOF

cat <<EOF > "$TARGET_DIR/Dockerfile"
FROM alpine:3.20

LABEL maintainer="dyzulk <https://github.com/dyzulk>"
LABEL org.opencontainers.image.title="${IMAGE_NAME^}"
LABEL org.opencontainers.image.source="https://github.com/dyzulk-lab/docker-images"

RUN apk add --no-cache bash curl

COPY rootfs/ /

CMD ["sh"]
EOF

echo "✓ Scaffolded new image in $TARGET_DIR"
