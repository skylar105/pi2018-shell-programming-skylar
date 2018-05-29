#!/usr/bin/env bash

# Accepts hail probability data over STDIN, sorts on WSR_ID and outputs on STDOUT

# Runs by default on 32 CPUs, suitable for xe nodes. Supply "-p n" to use a different thread count

# Note that if run w/ aprun, you will get the resource usage line included, but this will not match the
# format of the input CSV file and can be easily thrown away.

# Example execution: aprun -q -n 1 -d 32 -N 1 ./sort_on_wsrid.sh < /projects/training/baqk/hail-2017.csv > ~/scratch/pi2018-shell-programming-skylar/hail-2017.sorted.csv

NUMPROC=32

while getopts ":p:" option; do
    case "${option}" in
        p )
            NUMPROC="${OPTARG}"
            ;;
    esac
done

sort --parallel="${NUMPROC}" -t, -k 4b,4
