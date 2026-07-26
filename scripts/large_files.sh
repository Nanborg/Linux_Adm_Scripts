#!/bin/bash

target="${1:-.}"
size="${2:-100M}"
limit="${3:-20}"

if [ ! -d "$target" ]; then
    echo "Error: directory does not exist: $target" >&2
    exit 1
fi

case "$limit" in
    ''|*[!0-9]*)
        echo "Error: limit must be a number" >&2
        exit 1
        ;;
esac

echo "Large files"
echo "==========="
echo
find "$target" -type f -size +"$size" -exec du -h {} \; | sort -rh | head -n "$limit"
