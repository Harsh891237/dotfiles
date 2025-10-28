#!/bin/bash

PACKAGE_FILE_pacman="packages.txt"
PACKAGE_FILE_yay="packages_yay.txt"

# --- Read and install packages ---
sudo pacman -S --needed --noconfirm $(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE_pacman")
yay -S --needed --noconfirm $( grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE_yay" )
