#!/bin/bash
udevadm monitor -u | grep -E --line-buffered 'power_supply' | while read -r line; do
  pkill -SIGRTMIN+8 waybar
done
