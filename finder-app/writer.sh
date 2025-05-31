#!/bin/bash

# Script: writer.sh
# Description: Writes a string to a file, creating any necessary directories.
# Usage: ./writer.sh <file_path> <text_string>

# Check if both arguments are provided
if [ $# -lt 2 ]; then
    echo "Error: Two arguments required. Usage: $0 <file_path> <text_string>"
    exit 1
fi

writefile=$1
writestr=$2

# Extract the directory path from the file path
writedir=$(dirname "$writefile")

# Create the directory if it doesn't exist
mkdir -p "$writedir"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create directory $writedir"
    exit 1
fi

# Write the string to the file
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Failed to write to file $writefile"
    exit 1
fi

exit 0
