#!/usr/bin/env bash
#shellcheck disable=SC2086

exec \
    python3 -m wyoming_faster_whisper \
    --uri 'tcp://0.0.0.0:10300' \
    --data-dir /data \
    --download-dir /data "$@"
    --download-dir /data "$@" \
    --device cuda
