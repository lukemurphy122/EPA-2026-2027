#!/bin/bash

# Get the number of running processes
ct=$(ps -ef | wc -l)

# Get the current date and time
timestamp=$(date)

# Check if a number was provided
if [ -z "$1" ]; then
    echo "$timestamp - Please provide a number" >> process_log.txt
    exit 1
fi

# Check if the number of processes exceeds the input
if [ "$ct" -gt "$1" ]; then
    echo "$timestamp - Maximum number of processes exceeded" >> process_log.txt
else
    echo "$timestamp - The maximum number of processes NOT exceeded" >> process_log.txt
fi
