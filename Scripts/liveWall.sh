#!/bin/bash

if pgrep -x "mpvpaper" > /dev/null; then
    pkill mpvpaper
else
    mpvpaper -s -o "no-audio --loop shuffle" eDP-1 "$HOME/Desktop/Abhi/Fav/anim/vinland-saga.mp4" &
fi

