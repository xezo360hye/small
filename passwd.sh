#!/bin/bash

declare -i len=10
declare -l valid="[:alnum:]"

while [[ -n "$1" ]]; do
	case "$1" in
		-h|--help)
			echo "\
Usage: passwd [-l LENGTH] [-v VALID]

	LENGTH is any integer greater than 0
	VALID is pattern for valid characters, e.g. '[:alnum:]', '[:alpha:]-_'"
			exit;;
		-v|--valid)
			valid="$2";;
		-l|--length)
			if (( "$2" > 0 )); then
				len="$2"
			else
				echo "LENGTH must be integer greater than 0"
				exit
			fi;;
	esac
	shift
done


tr -dc "$valid" < /dev/random | head -c $len
echo
