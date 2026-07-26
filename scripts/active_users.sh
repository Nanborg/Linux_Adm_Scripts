#!/bin/bash

usage() {
    echo "Usage: $0 [--summary] [--history] [--help]"
    echo
    echo "Options:"
    echo " --summary Show only active sessions"
    echo " --history Show recent login history"
    echo " --help"
}

require_cmd() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "Error: required command not found: $1" >&2
        exit 1
    fi
}

mode="default"

case "$1" in
    "")
        mode="default"
        ;;
    --summary)
        mode="summary"
        ;;
    --history)
        mode="history"
        ;;
    --help|-h)
        usage
        exit 0
        ;;
    *)
        echo "Error: unknown option: $1 >&2
        usage
        exit 1
        ;;
esac

require_cmd who
require_cmd w

sessions=$(who)
session_count=$(printf "%s\n" "$sessions" | sed '/^$/d' | wc -l)

echo "Active users"
echo "==============="
echo "Session count: $session_count"
echo

if [ "$session_count" -eq 0 ]; then
  echo "No active user sessions found."
else
  echo "Sessions:"
  printf "%s\n" "$sessions"
fi

if [ "$mode" = "default" ] && [ "$session_count" -gt 0 ]; then
  echo
    echo  "Detailed activity"
    echo "=================="
    w
fi

if [ "$mode" = "history" ]; then
    require_cmd last
    echo
    echo "Recent login history"
    echo "===================="
    last | head -n 10
fi
