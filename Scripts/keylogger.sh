#!/bin/bash

# Log file for key presses
LOGFILE="keylog.txt"

# Clear the file at the start
> $LOGFILE

# Get the keyboard device ID

DEVICE_ID=13  # Your keyboard id from xinput list

echo "Logging keypresses from device ID $DEVICE_ID to $LOGFILE. Press Ctrl+C to stop."

# Start capturing key presses
xinput test $DEVICE_ID | while read -r line; do
    # Log the keypress with a timestamp
    echo "$(date '+%Y-%m-%d %H:%M:%S'): $line" >> $LOGFILE
done
