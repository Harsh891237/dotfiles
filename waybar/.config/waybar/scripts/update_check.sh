#!/bin/bash

# Check for required commands
if ! command -v checkupdates &> /dev/null || ! command -v yay &> /dev/null; then
    echo '{"text": " ?", "tooltip": "Missing dependencies"}'
    exit 1
fi

# Get number of official and AUR updates
pacman_updates=$(checkupdates 2> /dev/null | wc -l)
aur_updates=$(yay -Qum 2> /dev/null | wc -l)

total_updates=$((pacman_updates + aur_updates))

# Output as JSON for Waybar
echo "{\"text\": \" $total_updates\", \"tooltip\": \"$pacman_updates from pacman\\n$aur_updates from AUR\"}"


