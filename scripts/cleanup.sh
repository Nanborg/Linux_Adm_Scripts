#!/bin/bash

target="${1:-/tmp}"
days="${2:-7}"

if [ ! -d "$target" ]; then
    echo "Error: directory does not exist: $target" >&2
    exit 1
fi

case "$days" in
    ''|*[!0-9]*)
        echo "Error: days must be a number" >&2
        exit 1
        ;;
esac

echo "Cleanup dry-run"
echo "==============="
find "$target" -type f -mtime +"$days" -print
