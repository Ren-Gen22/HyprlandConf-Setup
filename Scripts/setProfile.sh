#!/bin/bash

asusctl profile -n

profile=$(asusctl profile -p | grep 'Active profile' | cut -d ' ' -f 4)

case "$profile" in
    Performance)
        notify-send " Performance"
        ;;
    Balanced)
        notify-send " Balanced"
        ;;
    Quiet)
        notify-send " Silent"
        ;;
    *)
        notify-send "Unknown profile!!"
        ;;
esac

