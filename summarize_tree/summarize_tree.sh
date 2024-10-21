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

# Debugging output: Check the provided directory
echo "Debug: Provided directory is $1"
ls -l "$1"

# Count directories (excluding the base directory itself)
num_dirs=$(find "$1" -mindepth 1 -type d 2>/dev/null | wc -l)
# Capture the status of the find command for directories
status_dirs=$?
# Count regular files
num_regular=$(find "$1" -type f 2>/dev/null | wc -l)
# Capture the status of the find command for files
status_files=$?

# Output the results with exact phrasing and formatting
echo "There were $num_dirs directories."
echo "There were $num_regular regular files."

# Debugging output
echo "Debug: num_dirs=$num_dirs, num_regular=$num_regular"
echo "Debug: status_dirs=$status_dirs, status_files=$status_files"

# Ensure a successful exit status if both find commands succeeded
if [ "$status_dirs" -eq 0 ] && [ "$status_files" -eq 0 ]; then
  exit 0
else
  exit 1
fi