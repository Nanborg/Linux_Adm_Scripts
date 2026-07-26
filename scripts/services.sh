#!/bin/bash

echo "Running services"
echo "================"
systemctl list-units --type=service --state=running --no-pager
