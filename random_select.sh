#!/usr/bin/env bash

# Example usage: aprun -q -n 1 -d 1 -N 1 ./random_select.sh 5 < hail-2017.sorted.subset.csv

set -eo pipefail

if [[ ${#} -eq 0 ]]; then
    echo "Supply number of lines to select randomly" >&2
    exit 1
fi

shuf -n "${1}" 