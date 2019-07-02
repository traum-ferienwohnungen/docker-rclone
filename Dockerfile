FROM alpine:3.10

ENV RCLONE_VERSION=v1.48.0 \
    ARCH=amd64 \
    SYNC_INTERVAL_SECONDS=300

RUN apk add --no-cache ca-certificates wget \
    && cd /tmp \
    && wget -q https://downloads.rclone.org/${RCLONE_VERSION}/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip \
    && unzip /tmp/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip \
    && mv /tmp/rclone-*-linux-${ARCH}/rclone /usr/bin \
    && apk del wget \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
