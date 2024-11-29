#!/usr/bin/env bash
version=$(curl -sX GET "https://api.github.com/repos/rhasspy/wyoming-faster-whisper/releases/latest" | jq --raw-output '.tag_name' 2>/dev/null)
#version="2.0.0"
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
