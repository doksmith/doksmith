FROM alpine:3.20

LABEL maintainer="doksmith <https://github.com/doksmith>"
LABEL org.opencontainers.image.title="Myapp"
LABEL org.opencontainers.image.description="Docker container for Myapp"
LABEL org.opencontainers.image.source="https://github.com/doksmith/docker-myapp"
LABEL org.opencontainers.image.documentation="https://github.com/doksmith/docker-myapp#readme"
LABEL org.opencontainers.image.vendor="doksmith"

RUN apk add --no-cache bash curl

COPY rootfs/ /

RUN chmod +x /entrypoint.sh 2>/dev/null || true

CMD ["sh"]
