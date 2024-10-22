#!/usr/bin/env bash
version=$(curl -sX GET "https://github.com/containernetworking/plugins/releases/tag/v1.6.0" | jq --raw-output '. | .tag_name' 2>/dev/null)
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
