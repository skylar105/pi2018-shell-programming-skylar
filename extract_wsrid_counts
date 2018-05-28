#!/usr/bin/env bash

# Accepts hail dataset over STDIN, prints unique list of WSR_IDs over STDOUT

cut -d, -f4 \
    |  sort \
    |  uniq -cd
