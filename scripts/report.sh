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
