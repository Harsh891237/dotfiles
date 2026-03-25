#!/usr/bin/env bash

# --- Configuration ---
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
ROFI_ICON_SIZE="180px"

# --- Check dependencies ---
command -v awww >/dev/null 2>&1 || { echo "swww not found"; exit 1; }
command -v matugen >/dev/null 2>&1 || { echo "matugen not found"; exit 1; }
command -v rofi >/dev/null 2>&1 || { echo "rofi not found"; exit 1; }

# --- Generate wallpaper list ---
wallpapers=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.svg" -o -iname "*.gif" -o -iname "*.jpeg" -o -iname "*.webp" \) | sort)

# --- Build rofi input with thumbnails and short names ---
list=""
for wp in $wallpapers; do
    name=$(basename "$wp")  # just the filename
    list+="$name\x00icon\x1f$wp\x1finfo\x1f$wp\n"
done

# --- Ask user to choose wallpaper ---
selected=$(echo -e "$list" | rofi -dmenu -p "Choose Wallpaper" -show-icons -theme "~/.config/hypr/scripts/wallpicker_theme.rasi")

# --- If user cancelled ---
[ -z "$selected" ] && exit 0

# --- Resolve the full path again before using it ---
fullpath=$(echo -e "$wallpapers" | grep "/$selected" | head -n 1)

# --- Apply wallpaper ---
awww img "$fullpath" --transition-type any --transition-duration 2 --transition-fps 60

# --- Notification (optional) ---
notify-send "Wallpaper changed" "$(basename "$fullpath")"

# --- Apply Matugen theme ---
echo "Running matugen..."
matugen image "$fullpath"

# --- Reload terminal colors dynamically ---
echo "Attempting to change terminal colors..."
killall -SIGUSR1 kitty
echo "Colors updated"

