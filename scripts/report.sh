#!/bin/bash

echo "System report"
echo "============="
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo
echo "Disk:"
df -h /
echo
echo "Memory:"
free -h
echo
echo "CPU:"
echo "Cores: $(nproc)"
echo "Load: $(awk '{print $1, $2, $3}' /proc/loadavg)"
echo
echo "Connected users:"
who
