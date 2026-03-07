FROM nvidia/cuda:13.1.1-cudnn-runtime-ubuntu24.04
#FROM ghcr.io/home-assistant/amd64-base-debian:bookworm

# Install Whisper
WORKDIR /usr/src
ARG VERSION
ENV PIP_BREAK_SYSTEM_PACKAGES=1

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    build-essential \
    git \
    python3-dev \
    python3-venv && \
  if [ -z ${VERSION+x} ]; then \
    VERSION=$(curl -sX GET "https://api.github.com/repos/rhasspy/wyoming-faster-whisper/releases/latest" \
    | awk '/tag_name/{print $4;exit}' FS='[""]'); \
  fi && \
  python3 -m venv /lsiopy && \
  pip install -U --no-cache-dir \
    pip \
    wheel && \
  pip install -U --no-cache-dir --find-links https://wheel-index.linuxserver.io/ubuntu/ \
    git+https://github.com/rhasspy/wyoming-faster-whisper@${VERSION} && \
  echo "**** cleanup ****" && \
  apt-get purge -y --auto-remove \
    build-essential \
    git \
    python3-dev && \
  rm -rf \
    /var/lib/apt/lists/* \
    /tmp/*

WORKDIR /
COPY ./apps/whisper/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
EXPOSE 10300

ENTRYPOINT ["/entrypoint.sh"]
