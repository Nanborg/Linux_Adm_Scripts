#!/bin/bash

usage() {
    echo "Usage: $0 [service_name]"
    echo
    echo "Examples:"
    echo " $0"
    echo " $0 ssh"
    echo " $0 sshd"
}

case "$1" in
    --help|-h)
        usage
        exit 0
        ;;
esac



if ! command -v systemctl >/dev/null 2>&1; then
    echo "Error: systemctl is nor available on this system" >&2
    exit 1
fi

service="$1"

if [ -z "$service" ]; then
    echo "Running services"
    echo "================"
    systemctl list-units --type=service --state=running --no-pager
    exit 0
fi

if systemctl is-active --quiet "$service"; then
    echo "Status: $service is active"
    exit 0
fi

echo "Status: $service is not active or not found"
exit 2
