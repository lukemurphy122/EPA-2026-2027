
#!/bin/bash

# Use getopts to read the required CPU count from the -n option
while getopts ":n:" opt; do
    case "$opt" in
        n)
            required_cpu=$OPTARG
            ;;
        :)
            printf "Error: Option -%s requires a number.\n" "$OPTARG"
            printf "Usage: %s -n MAX_NUM_CORES\n" "$0"
            exit 1
            ;;
        \?)
            printf "Error: Invalid option -%s\n" "$OPTARG"
            printf "Usage: %s -n MAX_NUM_CORES\n" "$0"
            exit 1
            ;;
    esac
done

# Check that the required CPU count was provided
if [ -z "$required_cpu" ]; then
    printf "Usage: %s -n MAX_NUM_CORES\n" "$0"
    exit 1
fi

# Check that the argument is a positive integer
if ! [[ "$required_cpu" =~ ^[0-9]+$ ]] || [ "$required_cpu" -lt 1 ]; then
    printf "Error: Please enter a positive integer.\n"
    exit 1
fi

# Count the available CPU cores
num_cpu=$(nproc)

# Compare available cores with the required number
if [ "$num_cpu" -lt "$required_cpu" ]; then
    printf "Error: Not enough CPU cores.\n"
    printf "Required: %s\n" "$required_cpu"
    printf "Available: %s\n" "$num_cpu"
    result=1
else
    printf "OK: The VM has enough CPU cores.\n"
    printf "Required: %s\n" "$required_cpu"
    printf "Available: %s\n" "$num_cpu"
    result=0
fi

# Explain the two Bash features used in this script
printf "\nBash commands/features used:\n"
printf "1. getopts reads and validates the -n command-line option.\n"
printf "2. printf displays formatted messages and CPU counts.\n"
printf "These features improve input handling and output readability.\n"

exit "$result"


