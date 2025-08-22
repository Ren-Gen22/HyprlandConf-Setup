#!/bin/bash
echo " "
echo "Yay packages require manual password entry pls check"
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
cd ..
rm -rf yay
# networkmanager-dmenu-git
yay -S --noconfirm spaceship-prompt wlogout hyprpolkitagent asusctl heroic-games-launcher linux-wifi-hotspot polychromatic mpvpaper plymouth-theme-hexagon-dots-git
