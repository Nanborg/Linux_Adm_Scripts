#!/bin/bash

usage() {
    echo "Usage: $0 [directory] [days] [--delete]"
    echo "Example: $0 /tmp 7"
}

target="${1:-/tmp}"
days="${2:-7}"
mode="${3:-dry-run}"

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

case "$days" in
    ''|*[!0-9]*)
        echo "Error: days must be a number" >&2
        exit 1
        ;;
esac

echo "Cleanup"
echo "======="
echo "Target: $target"
echo "Older than: $days days"
echo "Mode: $mode"
echo

if [ "$mode" = "--delete" ]; then
    find "$target" -type f -mtime +"$days" -print -delete
else
    find "$target" -type f -mtime +"$days" -print
    echo
    echo "Dry-run only. Add --delete to remove files."
fi
