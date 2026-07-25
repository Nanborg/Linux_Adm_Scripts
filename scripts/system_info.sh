#!/bin/bash

echo "System information"
echo "=================="
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Kernel: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "Uptime: $(uptime -p)"
echo "Date: $(date "+%Y-%m-%d %H:%M:%S")"
