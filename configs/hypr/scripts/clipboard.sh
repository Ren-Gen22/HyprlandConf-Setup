#!/bin/bash

# Default sort order
sort_order="--latest-first"

while true; do
    # Get clipboard list and format with indices
    mapfile -t entries < <(cliphist list "$sort_order")
    [[ ${#entries[@]} -eq 0 ]] && exit

    # Generate menu with latest entries on top
    menu=""
    for i in "${!entries[@]}"; do
        menu+="$i: ${entries[$i]}\n"
    done

    # Show in wofi (reverse index list shows latest at top)
    selected=$(printf "$menu" | wofi --dmenu --prompt="Clipboard History")
    [[ -z "$selected" ]] && exit

    # Extract index from selection
    index="${selected%%:*}"
    entry="${entries[$index]}"

    # Action menu
    action=$(printf "Copy\nDelete\nWipe All" | wofi --dmenu --prompt="Choose Action")

    case "$action" in
        "Copy")
            cliphist decode <<<"$entry" | wl-copy
            notify-send "Clipboard" "Copied to clipboard!"
            exit
            ;;
        "Delete")
            cliphist delete <<<"$entry"
            notify-send "Clipboard" "Entry deleted."
            ;;
        "Wipe All")
            cliphist wipe
            notify-send "Clipboard" "Clipboard history wiped."
            ;;
        *)
            exit
            ;;
    esac
done

