#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <program> [arguments]"
    exit 1
fi

program=$1
shift  
arguments="$@"

__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia $program $arguments
