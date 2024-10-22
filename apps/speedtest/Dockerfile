FROM alpine:latest

ENV SPEEDTEST_VERSION=1.2.0
ENV SCRIPT_EXPORTER_VERSION=v2.1.2

RUN apk add tar curl ca-certificates bash

RUN ARCH=$(apk info --print-arch) && \
    case "${TARGETPLATFORM}" in \
    'linux/amd64') _arch=i386 ;; \
    'linux/arm64') _arch=armhf ;; \
      *) _arch="$ARCH" ;; \
    esac && \
    echo https://install.speedtest.net/app/cli/ookla-speedtest-${SPEEDTEST_VERSION}-linux-${_arch}.tgz && \
    curl -fsSL -o /tmp/ookla-speedtest.tgz \
      https://install.speedtest.net/app/cli/ookla-speedtest-${SPEEDTEST_VERSION}-linux-${_arch}.tgz && \
    tar xvfz /tmp/ookla-speedtest.tgz -C /usr/local/bin speedtest && \
    rm -rf /tmp/ookla-speedtest.tgz

RUN ARCH=$(apk info --print-arch) && \
    case "$TARGETPLATFORM" in \
      'linux/amd64') _arch=amd64 ;; \
      'linux/arm64') _arch=arm64 ;; \
      'aarch64') _arch=arm64 ;; \
      *) _arch="$TARGETPLATFORM" ;; \
    esac && \
    echo https://github.com/ricoberger/script_exporter/releases/download/${SCRIPT_EXPORTER_VERSION}/script_exporter-linux-${_arch} && \
    curl -kfsSL -o /usr/local/bin/script_exporter \
      https://github.com/ricoberger/script_exporter/releases/download/${SCRIPT_EXPORTER_VERSION}/script_exporter-linux-${_arch} && \
    chmod +x /usr/local/bin/script_exporter

COPY ./apps/speedtest/config.yaml config.yaml
COPY ./apps/speedtest/speedtest-exporter.sh /usr/local/bin/speedtest-exporter.sh

EXPOSE 9469

ENTRYPOINT  [ "/usr/local/bin/script_exporter" ]

LABEL org.opencontainers.image.source="https://www.speedtest.net/apps/cli"
