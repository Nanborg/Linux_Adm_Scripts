#!/bin/bash

path="${1:-/}"

echo "Disk usage"
echo "=========="
df -h "$path"
