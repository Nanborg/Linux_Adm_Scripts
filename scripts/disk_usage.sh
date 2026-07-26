#!/bin/bash

usage() {
    echo "Usage: $0 [path] [threshold]"
    echo "Example: $0 / 80"
}

path="${1:-/}"
threshold="${2:-80}"

case "$path" in
    --help|-h)
    usage
    exit 0
    ;;
esac

if [ ! -e "$path" ]; then
    echo "Error: path does not exist: $path" >&2
    exit 1
fi

case "$threshold" in
    ''|*[!0-9]*)
    echo "Error: threshold must be a number" >&2
    exit 1
    ;;
esac

usage_percent=$(df -P "$path" | awk 'NR==2 {gsub("%", "", $5); print $5}')

echo "Disk usage"
echo "=========="
df -h "$path"
echo

if [ "$usage_percent" -ge "$threshold" ]; then
    echo "Status: WARNING, usage is ${usage_percent}% (threshold: ${threshold}%)"
    exit 2
fi

echo "Status: OK, usage is ${usage_percent}% (threshold: ${threshold}%)"
