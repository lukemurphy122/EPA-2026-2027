#!/bin/bash

# Get the number of running processes
ct=$(ps -ef | wc -l)

# Check if a number was provided
if [ -z "$1" ]; then
    echo "Please provide a number"
    exit 1
fi

# Check if the number of processes exceeds the input
if [ "$ct" -gt "$1" ]; then
    echo "Maximum number of processes exceeded"
else
    echo "The maximum number of processes NOT exceeded"
fi
