#!/bin/bash

usage() {
    echo "Usage: $0 [threshold_percent]"
    echo "Example: $0 80"
}

threshold="${1:-80}"

case "$threshold" in
    --help|-h)
        usage
        exit 0
        ;;
    ''|*[!0-9]*)
        echo "Error: threshold must be a number" >&2
        exit 1
        ;;
esac

if ! command -v free >/dev/null 2>&1; then
    echo "Error: free command not found" >&2
    exit 1
fi

read total used free_mem available <<EOF
$(free -m | awk 'NR==2 {print $2, $3, $4, $7}')
EOF

used_percent=$((used * 100 / total))

echo "memory usage"
echo "============"
echo "Total:        ${total} MB"
echo "Used:         ${used} MB"
echo "Free:         ${free_mem} MB"
echo "Available:    ${available} MB"
echo

if [ "$used_percent" -ge "$threshold" ]; then
    echo "Status: WARNING, memory usage is ${used_percent}%"
    exit 2
fi

echo "Status: OK, memory usage is ${used_percent}%"
