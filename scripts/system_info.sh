#!/bin/bash

echo "System information"
echo "=================="
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Kernel: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "Uptime: $(uptime -p)"
echo "Date: $(date "+%Y-%m-%d %H:%M:%S")"

os=name="uknown"
if [ -r /etc/os-release ]; then
    os_name=$(awk -F= '$1=="PRETTY_NAME" {gsub("\"", "", $2); print $2}' /etc/os-release)
fi
