#!/bin/bash
current_brightness=$(brightnessctl g)
max_brightness=$(brightnessctl max)
brightness_percentage=$(( $current_brightness * 100 / $max_brightness ))
notify-send "Brightness: $brightness_percentage"
