#!/bin/bash

pacman -Ss
yes | pacman -Sy git vim nvim wget gzip fzf tree firefox less btop pavucontrol cmus jq
yes | pacman -Sy wofi kitty foot dolphin waybar hyprland xorg-xwayland hyprpaper
yes | pacman -Sy ttf-jetbrains-mono-nerd

git clone https://github.com/LazyVim/starter ~/.config/nvim/

bash ./sync.sh
