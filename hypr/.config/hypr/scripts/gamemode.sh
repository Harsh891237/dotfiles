#!/usr/bin/env sh

# Check if animations are currently enabled (Returns 1 if enabled, 0 if disabled)
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$HYPRGAMEMODE" = "true" ] ; then
    # Pass configuration settings using valid nested Lua tables inside hl.config
    hyprctl eval "hl.config({ animations = { enabled = false } })"
    hyprctl eval "hl.config({ decoration = { shadow = { enabled = false }, blur = { enabled = false }, rounding = 0 } })"
    hyprctl eval "hl.config({ general = { gaps_in = 3, gaps_out = 0, border_size = 0 } })"
    exit
fi

# Cleanly reloads your main hyprland.lua to restore your default styles
hyprctl reload
