#!/bin/bash

echo "Large files"
echo "==========="
find . -type f -size +100M -print
