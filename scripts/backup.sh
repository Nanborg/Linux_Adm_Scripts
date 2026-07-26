#!/bin/bash

source_dir="$1"
backup_dir="${2:-backups}"

if [ -z "$source_dir" ]; then
    echo "Error: source directory is required" >&2
    exit 1
fi

if [ ! -d "$source_dir" ]; then
    echo "Error: source directory does not exist: $source_dir" >&2
    exit 1
fi

mkdir -p "$backup_dir"
timestamp=$(date +"%Y%m%d_%H%M%S")
base_name=$(basename "$source_dir")
archive="$backup_dir/${base_name}_backup_$timestamp.tar.gz"
tar -czf "$archive" "$source_dir"
