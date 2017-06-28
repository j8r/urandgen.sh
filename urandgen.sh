#!/bin/sh

case $1 in
	-h|--help|'') echo "$0 - generate random numbers in base32 or base64 with /dev/urandom
Usage: $0 [string length] [base]
string length: integer number
base: 32 or 64"; exit 0;;
	*[!0-9]*) echo "error: $1 is not an interger"; exit 1;;
esac

case $2 in
	32|64) ;;# good
	*) echo "error: $2 is not a supported base, chose either 32 or 64"; exit 1;;
esac

head -c $1 /dev/urandom | base$2 -iw 0 | head -c $1
echo
