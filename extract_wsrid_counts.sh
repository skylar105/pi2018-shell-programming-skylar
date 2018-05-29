#!/usr/bin/env bash

# Accepts hail dataset over STDIN, prints unique list of WSR_IDs over STDOUT

# Example exection: aprun -q -n 1 -d 1 -N 1 ./extract_wsrid_counts.sh < /projects/training/baqk/hail-2017.csv

cut -d, -f4 \
    |  sort \
    |  uniq -cd
