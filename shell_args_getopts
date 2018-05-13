#!/usr/bin/env bash

set -eo pipefail

while getopts ":a:b" option; do
	case "${option}" in
		a )
			opt_a="${OPTARG}"
			;;
		b )
			opt_b=1
			;;
		\? )
			echo "Invalid option" >&2
			exit 1
			;;
	esac
done

if [[ -z ${opt_a} ]]; then
	echo "Supply all arguments!" >&2
	exit 1
fi

echo "a=${opt_a},b=${opt_b}"
