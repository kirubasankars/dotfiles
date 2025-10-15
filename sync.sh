if [ -n "$SUDO_USER" ]; then
  REAL_USER="$SUDO_USER"
elif [ -n "$SUDO_UID" ]; then
  # SUDO_UID is numeric; map it to username
  REAL_USER="$(getent passwd "$SUDO_UID" | cut -d: -f1)"
else
  # Fall back to logname (login name) or id -un as last resort
  REAL_USER="$(logname 2>/dev/null || id -un)"
fi

cp -rv foot /home/$REAL_USER/.config/
cp -rv waybar /home/$REAL_USER/.config/
cp -rv wofi /home/$REAL_USER/.config/
cp -rv hypr /home/$REAL_USER/.config/
cp -rv walls /home/$REAL_USER/.config/
cp -v bashrc /home/$REAL_USER/.bashrc
cp -rv btop /home/$REAL_USER/.config/

sed -i "s/\$USER/$USER/g" /home/$REAL_USER/.config/wofi/config

mkdir -p /home/$REAL_USER/.config/nvim/lua/plugins && cp -v nvim/colorscheme.lua /home/$REAL_USER/.config/nvim/lua/plugins/colorscheme.lua
