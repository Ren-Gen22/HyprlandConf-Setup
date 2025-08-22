#!/bin/bash

# Check if xinput is installed
if ! command -v xinput &> /dev/null; then
    echo "xinput is not installed. Please install it using your package manager."
    exit 1
fi

# Function to toggle click lock
click_lock() {
    device_id=$(xinput list --short | grep -i "pointer" | head -n 1 | grep -o 'id=[0-9]*' | cut -d= -f2)
    if [ -z "$device_id" ]; then
        echo "Mouse pointer device not found."
        exit 1
    fi

    echo "Click lock enabled. Press and release the left mouse button to lock/unlock."
    
    while true; do
        state=$(xinput --query-state "$device_id" | grep "button\[1\]=")
        if echo "$state" | grep -q "down"; then
            echo "Mouse button locked. Drag away!"
            sleep 1  # Debounce time
            xdotool mousedown 1
            while xinput --query-state "$device_id" | grep -q "button\[1\]="; do
                sleep 0.1
            done
            xdotool mouseup 1
            echo "Click lock released."
        fi
        sleep 0.1
    done
}

# Check for required tools
if ! command -v xdotool &> /dev/null; then
    echo "xdotool is required. Install it using your package manager."
    exit 1
fi

click_lock
