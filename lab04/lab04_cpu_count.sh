
#!/bin/bash

# Count the number of CPU cores available on the VM
num_cpu=$(nproc)

# Get the minimum number of CPU cores required from argument 1
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
