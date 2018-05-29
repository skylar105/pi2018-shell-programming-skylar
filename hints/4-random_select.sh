#!/usr/bin/env bash

# Example usage: aprun -q -n 1 -d 1 -N 1 ./4-random_select.sh 5 < ~/scratch/pi2018-shell-programming-skylar/hail-2017.sorted.subset.csv

set -eo pipefail

if [[ ${#} -eq 0 ]]; then
    echo "Supply number of lines to select randomly" >&2
    exit 1
fi

shuf -n "${1}" 
