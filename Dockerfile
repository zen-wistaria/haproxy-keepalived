FROM alpine:3.20

ARG TITLE
ARG VERSION
ARG DESCRIPTION
ARG SOURCE
ARG URL
ARG AUTHORS
ARG BUILD_SOURCE
ARG BUILD_DATE
ARG VCS_REF

LABEL org.opencontainers.image.title="${TITLE}" \
      org.opencontainers.image.description="${DESCRIPTION}" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.url="${URL}" \
      org.opencontainers.image.source="${SOURCE}" \
      org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.build_source="${BUILD_SOURCE}" \
      org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.authors="${AUTHORS}"

RUN apk update && \
    apk add --no-cache keepalived haproxy rsyslog bash && \
    rm -rf /var/cache/apk/*

COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
