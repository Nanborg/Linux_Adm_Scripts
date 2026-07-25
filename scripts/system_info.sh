#!/bin/bash

usage() {
    echo "Usage: $0 [--json] [--help]"
    echo
    echo "Options:"
    echo " --json Print output as JSON"
    echo " --help Show this help message"
}

json=false

case "$1" in
    "")
        ;;
    --json)
        json=true
        ;;
    --help|-h)
        usage
        exit 0
        ;;
    *)
        echo "Error: unknown option: $1" >&2
        usage
        exit 1
        ;;
esac

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

if [ "$json" = true ]; then
  printf '{\n'
  printf '  "hostname": "%s",\n' "$hostname_value"
  printf '  "user": "%s",\n' "$user_value"
  printf '  "os": "%s",\n' "$os_name"
  printf '  "kernel": "%s",\n' "$kernel_value"
  printf '  "architecture": "%s",\n' "$arch_value"
  printf '  "uptime": "%s",\n' "$uptime_value"
  printf '  "date": "%s"\n' "$date_value"
  printf '}\n'
  exit 0
fi

echo "System information"
echo "=================="
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Kernel: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "Uptime: $(uptime -p)"
echo "Date: $(date "+%Y-%m-%d %H:%M:%S")"
