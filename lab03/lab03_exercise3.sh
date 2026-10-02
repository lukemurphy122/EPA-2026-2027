#!/bin/bash

# Get the number of running processes
ct=$(ps -ef | wc -l)

# Check that two parameters were provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: ./lab03_exercise3.sh <number> <screen|file>"
    exit 1
fi

# Determine the result
if [ "$ct" -gt "$1" ]; then
    message="Maximum number of processes exceeded"
else
    message="The maximum number of processes NOT exceeded"
fi

# Choose where to output the result
if [ "$2" = "screen" ]; then
    echo "$message"
elif [ "$2" = "file" ]; then
    echo "$(date) - $message" >> process_log.txt
else
    echo "Please choose either screen or file"
    exit 1
fi
