#!/bin/bash

# Check if a path is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Ensure the directory exists
if [ ! -d "$1" ]; then
  echo "Error: Directory $1 does not exist."
  exit 1
fi

# Count directories (including the base directory itself)
num_dirs=$(find "$1" -type d | wc -l | xargs)

# Count regular files
num_regular=$(find "$1" -type f | wc -l | xargs)

# Output the results with exact phrasing and formatting
echo "There were $num_dirs directories."
echo "There were $num_regular regular files."