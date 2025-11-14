#!/bin/bash

case "$1" in
  brightness)
    percent=$(brightnessctl get)
    max=$(brightnessctl max)
    level=$((percent * 100 / max))
    notify-send -t 1500 -h int:value:$level -h string:x-canonical-private-synchronous:brightness "Brightness" "$level%"
    ;;

  volume)
    muted=$(pamixer --get-mute)
    if [ "$muted" = "true" ]; then
        notify-send -t 1500 -h string:x-canonical-private-synchronous:volume "Volume" "Muted"
    else
        vol=$(pamixer --get-volume)
        notify-send -t 1500 -h int:value:$vol -h string:x-canonical-private-synchronous:volume "Volume" "$vol%"
    fi
    ;;

  *)
    echo "Usage: $0 [brightness|volume]"
    exit 1
    ;;
esac
