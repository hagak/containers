FROM nvidia/cuda:13.0.0-cudnn-runtime-ubuntu24.04

# Install Whisper
WORKDIR /usr/src
ARG VERSION

RUN apt-get update \
  && apt-get install -y --no-install-recommends python3-pip wget kmod \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# install wyoming-faster-whisper and nvidia cuda libs
RUN python3 -m pip install --no-cache-dir "wyoming-faster-whisper @ https://github.com/rhasspy/wyoming-faster-whisper/archive/refs/tags/${VERSION}.tar.gz"

WORKDIR /
COPY ./apps/whisper/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
EXPOSE 10300

ENTRYPOINT ["/entrypoint.sh"]
