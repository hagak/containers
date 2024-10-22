FROM --platform=$TARGETPLATFORM alpine as base

ARG TARGETPLATFORM
ARG TARGETARCH
ARG VERSION

USER root
ADD https://github.com/containernetworking/plugins/releases/download/${VERSION}/cni-plugins-linux-${TARGETARCH}-v1.5.0.tgz /
COPY --chmod=755 ./entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
