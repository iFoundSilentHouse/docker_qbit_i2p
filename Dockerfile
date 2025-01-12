FROM alpine:latest
RUN apk update && apk add --no-cache qbittorrent-nox i2pd
RUN addgroup -S qbit
RUN adduser -S qbit -G qbit
USER qbit
COPY --chown=qbit:qbit config /home/qbit/.config
COPY --chown=qbit:qbit local /home/qbit/.local
RUN mkdir /home/qbit/Torrents
