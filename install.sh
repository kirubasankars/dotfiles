#!/bin/bash

if [ -n "$SUDO_USER" ]; then
  REAL_USER="$SUDO_USER"
elif [ -n "$SUDO_UID" ]; then
  # SUDO_UID is numeric; map it to username
  REAL_USER="$(getent passwd "$SUDO_UID" | cut -d: -f1)"
else
  # Fall back to logname (login name) or id -un as last resort
  REAL_USER="$(logname 2>/dev/null || id -un)"
fi

pacman -Sy --noconfirm git vim nvim wget gzip fzf tree firefox less btop pavucontrol cmus jq python3 curl tldr sqlite3
pacman -Sy --noconfirm wofi kitty foot dolphin waybar hyprland xorg-xwayland hyprpaper wl-clipboard
pacman -Sy --noconfirm ttf-jetbrains-mono-nerd

git clone https://github.com/LazyVim/starter /home/$SUDO_USER/.config/nvi
