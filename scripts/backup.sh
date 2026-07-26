#!/bin/bash

source_dir="$1"

if [ -z "$source_dir" ]; then
    echo "Error: source directory is required" >&2
    exit 1
fi

if [ ! -d "$source_dir" ]; then
    echo "Error: source directory does not exist: $source_dir" >&2
    exit 1
fi

tar -czf backup.tar.gz "$source_dir"
