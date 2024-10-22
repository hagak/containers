#!/usr/bin/env bash
version=1.2.0
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
