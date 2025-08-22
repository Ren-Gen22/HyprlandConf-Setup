#!/bin/sh
IMAGE=/home/renjan/Desktop/Abhi/Fav/guts/berserk.jpg
CACHE=/tmp/i3lock_$(basename "$IMAGE")

# Only process if image changed or cache doesn't exist
if [ ! -f "$CACHE" ] || [ $(stat -c %Y "$IMAGE") -gt $(stat -c %Y "$CACHE") ]; then
    magick "$IMAGE" \
        -filter Gaussian \
        -blur 0x6 \
        -brightness-contrast -10x0 \
        "$CACHE"
fi

i3lock -i "$CACHE" \
    --clock \
    --time-str="%H:%M" \
    --date-str="%A, %d %B" \
    --time-color=ffffffaa \
    --date-color=ffffffaa \
    --time-size=32 \
    --date-size=16 \
    --indicator \
    --radius=120 \
    --ring-width=8 \
    --inside-color=00000000 \
    --ring-color=00000000 \
    --insidever-color=00000000 \
    --ringver-color=888888ff \
    --insidewrong-color=00000000 \
    --ringwrong-color=666666ff \
    --keyhl-color=ffffffff \
    --bshl-color=ff0000ff \
    --separator-color=00000000 \
    --verif-color=ffffffff \
    --wrong-color=ffffffff \
    --modif-color=ffffffff \
    --noinput-text=""
