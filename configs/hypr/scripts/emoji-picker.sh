
#!/bin/bash

EMOJI_LIST="$HOME/.config/wofi/emoji.txt"

selection=$(cat "$EMOJI_LIST" | awk '{print tolower($0)}' | wofi --dmenu --prompt "Pick an emoji:" --width 400 --lines 10)

if [[ -n "$selection" ]]; then
    emoji=$(grep -i "$(echo "$selection" | awk '{print $1}')" "$EMOJI_LIST" | head -n 1 | awk '{print $1}')
    echo -n "$emoji" | wl-copy
    notify-send "Copied to clipboard" "$emoji"
fi

