#!/bin/bash

path="${1:-/}"
threshold="${2:-80}"

if [ ! -e "$path" ]; then
    echo "Error: path does not exist: $path" >&2
    exit 1
fi

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
