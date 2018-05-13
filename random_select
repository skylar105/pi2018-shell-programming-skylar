#!/usr/bin/env bash

set -eo pipefail

if [[ ${#} -eq 0 ]]; then
    echo "Supply number of lines to select randomly" >&2
    exit 1
fi

shuf -n "${1}" 
