#!/bin/bash

pacman -Ss
yes | pacman -Sy git vim nvim wget gzip fzf tree firefox less btop pavucontrol cmus jq python3 curl tldr sqlite3
yes | pacman -Sy wofi kitty foot dolphin waybar hyprland xorg-xwayland hyprpaper wl-clipboard
yes | pacman -Sy ttf-jetbrains-mono-nerd

git clone https://github.com/LazyVim/starter ~/.config/nvim/

bash ./sync.sh
