#!/bin/bash

# Script: finder.sh
# Description: Searches for a string in all files within a specified directory.
# Usage: ./finder.sh <directory> <search_string>

# Check if both arguments are provided
if [ $# -lt 2 ]; then
    echo "Error: Two arguments required. Usage: $0 <directory> <search_string>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if the first argument is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory."
    exit 1
fi

# Count the number of files in the directory and its subdirectories
filecount=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines that contain the search string
matchcount=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the result
echo "The number of files are $filecount and the number of matching lines are $matchcount"

exit 0
