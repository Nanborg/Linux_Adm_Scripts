#!/bin/bash

target="${1:-.}"
size="${2:-100M}"
if [ ! -d "$target" ]; then
    echo "Error: directory does not exist: $target" >&2
    exit 1
fi

echo "Large files"
echo "==========="
echo
find "$target" -type f -size +100M -print
