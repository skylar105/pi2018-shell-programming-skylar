#!/usr/bin/env bash

# Accepts hail dataset over STDIN, prints unique list of WSR_IDs over STDOUT sorted by incidence count

# Example exection: aprun -q -n 1 -d 1 -N 1 ./extract_wsrid_counts.sh < /projects/training/baqk/hail-2017.csv > ~/scratch/wsir_counts.txt

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
