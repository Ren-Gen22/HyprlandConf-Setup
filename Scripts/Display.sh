#!/bin/bash

printf "External Display\n1.Duplicate\n2.Extend\n3.Reduce Refresh Rate 60 Hz\n4.Increase Refresh Rate 144Hz\n5.Default\n"
read -n 1 k
echo 
# Duplicate Screen
#xrandr --output HDMI-1-0 --mode 1920x1080 --same-as eDP1
# # for Extending
#xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI-1-0 --mode 1920x1080 --right-of eDP1
case "$k" in 
    [1])
        echo "Duplicating Display"
        xrandr --output HDMI-A-1 --mode 1920x1080 --same-as eDP1

        ;;
    [2])
        echo "Extending Display"
        xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI-A-1 --mode 1920x1080 --right-of eDP1

        ;;
    [3])
        echo "60 Hz"
        xrandr --output eDP1 --mode 1920x1080 --rate 60
        ;;
    [4])
        echo "144 Hz"
        xrandr --output eDP1 --mode 1920x1080 --rate 144
        ;;

    [5])
        echo "Defaults"
        xrandr --auto

        ;;
    *)
        echo "Invalid !!!"
        ;;
esac

