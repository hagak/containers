FROM docker.io/library/python:3.13.1-alpine

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

USER root

# hadolint ignore=DL3008,DL3015,SC2086
RUN \
    apk add --no-cache \
    nut-server \
    nut-snmp \

WORKDIR /config

EXPOSE 3493

COPY ./apps/network-ups-tools/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
