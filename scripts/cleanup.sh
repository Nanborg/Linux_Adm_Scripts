#!/bin/bash

target="${1:-/tmp}"
days=7

echo "Cleanup dry-run"
echo "==============="
find "$target" -type f -mtime +"$days" -print
