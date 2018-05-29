#!/usr/bin/env bash

# Accepts as input a hail dataset sorted on WSR_ID. Each argument to wsrid_lines will be a
# weather surveillance radar ID (WSR_ID). Outputs all lines matching the given WSR_IDs.

# Example usage: aprun -q -n 1 -d 1 -N 1 ./3-wsrid_lines.sh KDEN KBOS KGLD KCXX KCMH < ~/scratch/pi2018-shell-programming-skylar/hail-2017.sorted.csv

if [[ ${#} -eq 0 ]]; then
    echo "Supply at least one WSR_ID to join on" >&2
    exit 1
fi

i=0
# Iterate over each command line argument and output it to STDOUT, delimited with newlines,
# and sorted to comply with join's input requirements.
# join will read the list of join conditions as the first file, and the hail dataset over STDIN.
join -t, -1 1 -2 4 <(
    for arg; do
        # Do not output newline on the last argument, since join will interpret that as
        # an empty join field
        if [[ ${i} -eq ${#} ]]; then
            echo -n "${arg}"
        else
            echo "${arg}"
        fi
        i=$((i+1))
    done|sort) -
