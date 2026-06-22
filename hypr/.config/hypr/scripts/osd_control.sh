#!/bin/bash

# Explicitly add common binary locations to the PATH
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin"

# Configuration
VOLUME_STEP="2%"      # Increment step for volume
BRIGHTNESS_STEP="2%"  # Increment step for brightness

case "$1" in
    vol_up)
        # Increase volume with a limit of 100% (1.0)
        wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ "${VOLUME_STEP}+"
        
        # Fetch current volume (gives a decimal like 0.53)
        VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
        qs ipc call osd display "Volume" "$VOL"
        ;;
        
    vol_down)
        # Decrease volume
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "${VOLUME_STEP}-"
        
        # Fetch current volume
        VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
        qs ipc call osd display "Volume" "$VOL"
        ;;
        
    vol_mute)
        # Toggle mute
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        
        # Fetch volume state once to avoid redundant calls
        VOL_INFO=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
        VOL=$(echo "$VOL_INFO" | awk '{print $2}')
        
        # Check if output contains "MUTED"
        if echo "$VOL_INFO" | grep -q "MUTED"; then
            qs ipc call osd display "Muted" "$VOL"
        else
            qs ipc call osd display "Volume" "$VOL"
        fi
        ;;
        
    bright_up)
        # Increase brightness
        brightnessctl set "${BRIGHTNESS_STEP}+"
        
        # Fetch brightness percentage and convert to decimal (e.g., 50% -> 0.50)
        BRIGHT=$(brightnessctl -m | awk -F, '{sub(/%/,"",$4); printf "%.2f\n", $4/100}')
        qs ipc call osd display "Brightness" "$BRIGHT"
        ;;
        
    bright_down)
        # Decrease brightness
        brightnessctl set "${BRIGHTNESS_STEP}-"
        
        # Fetch brightness percentage and convert to decimal
        BRIGHT=$(brightnessctl -m | awk -F, '{sub(/%/,"",$4); printf "%.2f\n", $4/100}')
        qs ipc call osd display "Brightness" "$BRIGHT"
        ;;

    *)
        echo "Usage: $0 {vol_up|vol_down|vol_mute|bright_up|bright_down}"
        exit 1
        ;;
esac