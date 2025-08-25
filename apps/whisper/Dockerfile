#FROM nvidia/cuda:12.6.3-cudnn-runtime-ubuntu22.04
FROM ghcr.io/home-assistant/amd64-base-debian:bookworm

# Install Whisper
WORKDIR /usr/src
ARG VERSION
ENV PIP_BREAK_SYSTEM_PACKAGES=1

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        netcat-traditional \
        python3 \
        python3-dev \
        python3-pip \
    \
    && pip3 install --no-cache-dir -U \
        setuptools \
        wheel \
    && pip3 install --no-cache-dir \
        "wyoming-faster-whisper @ https://github.com/rhasspy/wyoming-faster-whisper/archive/refs/tags/v2.4.0.tar.gz" \
        'transformers==4.52.4' \
    \
    && pip3 install --no-cache-dir \
        --index-url 'https://download.pytorch.org/whl/cpu' \
        'torch==2.6.0' \
    \
    && apt-get purge -y --auto-remove \
        build-essential \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY ./apps/whisper/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
EXPOSE 10300

ENTRYPOINT ["/entrypoint.sh"]
