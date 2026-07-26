#!/bin/bash
usage() {
    echo "Usage: $0 [process_count]"
    echo "Example: $0 10"
}

count="${1:-5}"

case "$count" in
    --help|-h)
        usage
        exit 0
        ;;
    ''|*[!0-9]*)
        echo "Error: process_count must be a number" >&2
        exit 1
        ;;
esac

cores=$(nproc)
load_all=$(awk '{print $1, $2, $3}' /proc/loadavg)

echo "CPU usage"
echo "========="
echo "CPU cores: $cores"
echo "Load average:"
echo
echo "Load average 1/5/15 min: $load_all"
echo
echo "Top CPU processes:"
ps aux --sort=-%cpu | head -n "$((count + 1))"
