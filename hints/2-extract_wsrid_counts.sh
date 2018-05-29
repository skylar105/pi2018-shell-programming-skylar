#!/usr/bin/env bash

# Accepts hail dataset sorted by WSR_ID over STDIN, prints unique list of WSR_IDs over STDOUT sorted by incidence count

# Example exection: aprun -q -n 1 -d 32 -N 1 ./2-extract_wsrid_counts.sh < ~/scratch/pi2018-shell-programming-skylar/hail-2017.sorted.csv > ~/scratch/pi2018-shell-programming-skylar/wsir_counts.txt

NUMPROC=32

while getopts ":p:" option; do
    case "${option}" in
        p )
            NUMPROC="${OPTARG}"
            ;;
    esac
done

cut -d, -f4 \
    | uniq -cd \
    | sort --parallel="${NUMPROC}" -nr
