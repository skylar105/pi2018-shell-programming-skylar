#!/usr/bin/env bash

# Accepts hail probability data over STDIN, sorts on WSR_ID and outputs on STDOUT

# Runs by default on 8 CPUs, suitable for both xe and xk nodes. Supply "-p n" to use a different thread count

NUMPROC=8

while getopts ":p:" option; do
    case "${option}" in
        p )
            NUMPROC="${OPTARG}"
            ;;
    esac
done

sort --parallel="${NUMPROC}" -t, -k 4b,4
