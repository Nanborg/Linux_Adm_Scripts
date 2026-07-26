#!/bin/bash

usage() {
    echo "Usage: $0 [directory] [size] [limit]"
    echo "Example: $0 /home 100M 20"
}

target="${1:-.}"
size="${2:-100M}"
limit="${3:-20}"

case "$target" in
    --help|-h)
        usage
        exit 0
        ;;
esac

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
echo "Target: $target"
echo "Size: +$size"
echo "Limit: $limit"
echo

find "$target" -type f -size +"$size" -exec du -h {} \; 2>/dev/null | sort -rh | head -n "$limit"
