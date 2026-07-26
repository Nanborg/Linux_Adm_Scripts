#!/bin/bash

usage() {
    echo "Usage $0 <source_directory> [backup_directory]"
    echo "Example: $0 scripts backups"
}

case "$1" in
    --help|-h)
        usage
        exit 0
        ;;
esac

source_dir="$1"
backup_dir="${2:-backups}"

if [ -z "$source_dir" ]; then
    echo "Error: source directory is required" >&2
    usage
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
echo "Backup created: $archive"
echo "Content preview:"
tar -tzf "$archive" | head -n 10
