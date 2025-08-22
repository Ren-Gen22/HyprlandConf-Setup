#!/bin/bash

# Check if at least one argument is provided
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <program> [arguments]"
    exit 1
fi

# Get the program name and the arguments
program=$1
shift  # Shift the arguments to remove the first one
arguments="$@"

# Run the program with the NVIDIA GPU
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia $program $arguments
