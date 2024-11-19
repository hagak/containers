ARG VERSION
FROM docker.io/library/alpine:3.20
# FROM --platform=$TARGETPLATFORM alpine as base

ARG TARGETPLATFORM
ARG TARGETARCH
ARG VERSION

USER root
ADD https://github.com/containernetworking/plugins/releases/download/v${VERSION}/cni-plugins-linux-${TARGETARCH}-v${VERSION}.tgz /
COPY --chmod=755 ./apps/cni-plugin/entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
