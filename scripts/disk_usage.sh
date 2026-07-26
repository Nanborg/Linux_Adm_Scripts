#!/bin/bash

path="${1:-/}"

if [ ! -e "$path" ]; then
    echo "Error: path does not exist: $path" >&2
    exit 1
fi

usage_percent=$(df -P "$path" | awk 'NR==2 {gsub("%", "", $5); print $5}')

echo "Disk usage"
echo "=========="
df -h "$path"
echo
echo "Usage: ${usage_percent}%"
