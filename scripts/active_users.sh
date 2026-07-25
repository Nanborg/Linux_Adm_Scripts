#!/bin/bash

sessions=$(who)
session_count=$(printf "%s\n" "$sessions" | sed '/^$/d' | wc -l)

echo "Connected users"
echo "==============="
echo "Session count: $session_count"
echo
printf "%s\n" "$sessions"
echo
echo  "Detailed sessions"
echo "=================="
w
