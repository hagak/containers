FROM nvidia/cuda:12.6.3-cudnn-runtime-ubuntu22.04

# Install Whisper
WORKDIR /usr/src
ARG VERSION

RUN \
apt-get update \
&& apt-get install -y --no-install-recommends \
    build-essential \
    python3 \
    python3-dev \
    python3-pip \
\
&& pip3 install --no-cache-dir -U \
    setuptools \
    wheel \
&& pip3 install --no-cache-dir \
    transformers datasets[audo] accelerate \
    --extra-index-url https://www.piwheels.org/simple \
    "wyoming-faster-whisper @ https://github.com/rhasspy/wyoming-faster-whisper/archive/refs/tags/v${VERSION}.tar.gz" \
\
&& apt-get purge -y --auto-remove \
    build-essential \
    python3-dev \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY ./apps/whisper/entrypoint.sh /entrypoint.sh
ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
EXPOSE 10300

ENTRYPOINT ["bash", "/entrypoint.sh"]
