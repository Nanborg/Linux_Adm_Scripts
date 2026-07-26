#!/bin/bash

generate_report() {
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
}



report_dir="reports"

report="$report_dir/system_report_$timestamp.txt"

mkdir -p "$report_dir"
generate_report > "$report"
echo "Report created: $report"
