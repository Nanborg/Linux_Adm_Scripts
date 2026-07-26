#!/bin/bash


if ! command -v systemctl >/dev/null 2>&1; then
    echo "Error: systemctl is nor available on this system" >&2
    exit 1
fi

echo "Running services"
echo "================"
systemctl list-units --type=service --state=running --no-pager
