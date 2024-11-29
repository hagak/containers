# HOWTO: docker run -it --rm --gpus '"device=0"' .
FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

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
    && python3 -m pip install --upgrade pip \
    && pip3 install --no-cache-dir -U \
        setuptools \
        wheel \
    && pip3 install --no-cache-dir \
        "wyoming-faster-whisper==${VERSION}" \
    \
    && apt-get purge -y --auto-remove \
        build-essential \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY ./apps/whisper/entrypoint.sh /entrypoint.sh
ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
EXPOSE 10300

ENTRYPOINT ["/entrypoint.sh"]
