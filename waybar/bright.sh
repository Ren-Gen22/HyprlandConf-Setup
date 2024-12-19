#!/bin/bash

# Define increment level
INCREMENT=5

# Get the maximum and current brightness levels
max_brightness=$(brightnessctl m)  # Maximum brightness
current_brightness=$(brightnessctl g)  # Current brightness

# Calculate current brightness percentage
brightness=$((current_brightness * 100 / max_brightness))

# Check command-line argument to adjust brightness
case "$1" in
    increase)
        # Increase brightness by INCREMENT%
        new_brightness=$((brightness + INCREMENT))
        if [ "$new_brightness" -gt 100 ]; then
            new_brightness=100
        fi
        brightnessctl s "$new_brightness%"
        ;;
    decrease)
        # Decrease brightness by INCREMENT%
        new_brightness=$((brightness - INCREMENT))
        if [ "$new_brightness" -lt 0 ]; then
            new_brightness=0
        fi
        brightnessctl s "$new_brightness%"
        ;;
    *)
        # No argument provided; just display the current brightness
        new_brightness=$brightness
        ;;
esac

# Get updated brightness percentage
brightness=$(brightnessctl g)
brightness=$((brightness * 100 / max_brightness))

# Define icons based on brightness level
if [ "$brightness" -ge 75 ]; then
    icon="\uf185"  # Full brightness icon
elif [ "$brightness" -ge 25 ]; then
    icon="\uf111"  # Mid brightness icon
else
    icon="\uf10c"  # Low brightness icon
fi

# Output JSON for Waybar
echo "{\"text\": \"$brightness% $icon\", \"tooltip\": \"Brightness: $brightness%\"}"

