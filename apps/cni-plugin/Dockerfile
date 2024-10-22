FROM --platform=$TARGETPLATFORM alpine as base

ARG TARGETPLATFORM
ARG TARGETARCH

USER root
ADD https://github.com/containernetworking/plugins/releases/download/v1.5.0/cni-plugins-linux-${TARGETARCH}-v1.5.0.tgz /
COPY --chmod=755 ./entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
