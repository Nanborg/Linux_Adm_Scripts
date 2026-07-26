#!/bin/bash

if ! command -v free >/dev/null 2>&1; then
    echo "Error: free command not found" >&2
    exit 1
fi

read total used free_mem available <<EOF
$(free -m | awk 'NR==2 {print $2, $3, $4, $7}')
EOF

used_percent=$((used * 100 / total))
echo "Used:      ${used} MB (${used_percent}%)"

echo "memory usage"
echo "============"
echo "Total:        ${total} MB"
echo "Used:         ${used} MB"
echo "Free:         ${free_mem} MB"
echo "Available:    ${available} MB"
