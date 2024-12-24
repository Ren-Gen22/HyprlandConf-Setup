#!/bin/bash

asusctl profile -n

profile=$(asusctl profile -p | grep 'Active profile' | cut -d ' ' -f 4)

case "$profile" in
    Performance)
        dunstify " Performance"
        ;;
    Balanced)
        dunstify " Balanced"
        ;;
    Quiet)
        dunstify " Silent"
        ;;
    *)
        dunstify "Unknown profile!!"
        ;;
esac

