#!/bin/bash

# The path to the selected wallpaper is passed as the first argument
WALLPAPER="$1"

# 1. Apply wallpaper with smooth transition
awww img "$WALLPAPER" \
    --transition-type wipe \
    --transition-angle 45 \
    --transition-step 90 \
    --transition-fps 50 \
    --transition-duration 1.5

# 2. Update Matugen
matugen image "$WALLPAPER" --source-color-index 0

kill -SIGUSR1 $(pgrep kitty)
