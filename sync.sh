cp -rv foot ~/.config/
cp -rv waybar ~/.config/
cp -rv wofi ~/.config/
cp -rv hypr ~/.config/
cp -rv walls ~/.config/
cp -v bashrc ~/.bashrc
cp -rv btop ~/.config/

sed -i "s/\$USER/$USER/g" ~/.config/wofi/config

mkdir -p ~/.config/nvim/lua/plugins && cp -v nvim/colorscheme.lua ~/.config/nvim/lua/plugins/colorscheme.lua
