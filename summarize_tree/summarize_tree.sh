#!/bin/bash

# Check if a path is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Count directories (excluding the base directory itself)
num_dirs=$(find "$1" -type d | wc -l)
# Count regular files
num_regular=$(find "$1" -type f | wc -l)

# Output the results
echo "There were $((num_dirs - 1)) directories." # Subtract 1 to exclude the base directory itself
echo "There were $num_regular regular files." # output the number of regular files
