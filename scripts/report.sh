#!/bin/bash

usage() {
    echo "Usage $0 [--stdout] [--help]"
}

output="file"

case "$1" in
    "")
        ;;
    --stdout)
        output="stdout"
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

if [ "$output" = "stdout" ]; then
    generate_report
    exit 0;
fi

report_dir="reports"

report="$report_dir/system_report_$timestamp.txt"

mkdir -p "$report_dir"
generate_report > "$report"
echo "Report created: $report"
