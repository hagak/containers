FROM nvidia/cuda:12.6.3-cudnn-runtime-ubuntu22.04

# Install Whisper
WORKDIR /usr/src
ARG VERSION

RUN apt-get update \
  && apt-get install -y --no-install-recommends python3-pip wget kmod \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# install wyoming-faster-whisper and nvidia cuda libs
RUN python3 -m pip install --no-cache-dir --break-system-packages "wyoming-faster-whisper @ https://github.com/rhasspy/wyoming-faster-whisper/archive/refs/tags/${VERSION}.tar.gz"

WORKDIR /
COPY ./apps/whisper/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
EXPOSE 10300

ENTRYPOINT ["/entrypoint.sh"]
