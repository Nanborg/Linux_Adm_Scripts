#!/bin/bash

os=name="unknown"
if [ -r /etc/os-release ]; then
    os_name=$(awk -F= '$1=="PRETTY_NAME" {gsub("\"", "", $2); print $2}' /etc/os-release)
fi

hostname_value=$(hostname)
user_value=$(whoami)
kernel_value=$(uname -r)
arch_value=$(uname -m)
uptime_value=$(uptime -p)
date_value=$(date "+%Y-%m-%d %H:%M:%S")

echo "System information"
echo "=================="
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Kernel: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "Uptime: $(uptime -p)"
echo "Date: $(date "+%Y-%m-%d %H:%M:%S")"
