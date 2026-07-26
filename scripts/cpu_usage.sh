#!/bin/bash

cores=$(nproc)
load_all=$(awk '{print $1, $2, $3}' /proc/loadavg)

echo "CPU usage"
echo "========="
echo "CPU cores: $cores"
echo "Load average:"
echo
echo "Load average 1/5/15 min: $load_all"
echo
echo "Top CPU processes:"
ps aux --sort=-%cpu | head -n 6
