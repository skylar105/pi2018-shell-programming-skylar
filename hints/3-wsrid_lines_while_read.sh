#!/usr/bin/env bash

# Accepts as input a hail dataset sorted on WSR_ID. Each argument to wsrid_lines will be a
# weather surveillance radar ID (WSR_ID). Outputs all lines matching the given WSR_IDs.

# Example usage: aprun -q -n 1 -d 1 -N 1 ./3-wsrid_lines_while_read.sh KDEN KBOS KGLD KCXX KCMH < ~/scratch/pi2018-shell-programming-skylar/hail-2017.sorted.csv

if [[ ${#} -eq 0 ]]; then
    echo "Supply at least one WSR_ID to match" >&2
    exit 1
fi

OLDIFS="${IFS}"
IFS=","

while read ZTIME LON LAT WSR_ID CELL_ID RANGE AZIMUTH SEVPROB PROB MAXSIZE; do
    for arg; do
        if [[ "${WSR_ID}" = "${arg}" ]]; then
            echo "${ZTIME},${LON},${LAT},${WSR_ID},${CELL_ID},${RANGE},${AZIMUTH},${SEVPROB},${PROB},${MAXSIZE}"
        fi
    done
done | sort

IFS="${OLDIFS}"
