
#!/bin/bash

# Check whether the user supplied an argument
if [ -z "$1" ]; then
    echo "Usage: lab04_cpu_count_2.sh [MAX_NUM_CORES]"
    exit 1
fi

# Count the number of available CPU cores
num_cpu=$(nproc)

# Store the minimum number of CPU cores required
required_cpu=$1

# Check whether the VM has enough CPU cores
if [ "$num_cpu" -lt "$required_cpu" ]; then
    echo "Error: Not enough CPU cores."
    echo "Required: $required_cpu"
    echo "Available: $num_cpu"
    exit 1
else
    echo "OK: The VM has enough CPU cores."
    echo "Required: $required_cpu"
    echo "Available: $num_cpu"
fi

