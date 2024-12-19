#!/bin/bash

# $$\ $$\       $$\      $$\                               $$\                           $$\ $$\ 
# $$ |$$ |      $$ | $\  $$ |                              \__|                          $$ |$$ |
# $$ |$$ |      $$ |$$$\ $$ | $$$$$$\   $$$$$$\  $$$$$$$\  $$\ $$$$$$$\   $$$$$$\        $$ |$$ |
# $$ |$$ |      $$ $$ $$\$$ | \____$$\ $$  __$$\ $$  __$$\ $$ |$$  __$$\ $$  __$$\       $$ |$$ |
# \__|\__|      $$$$  _$$$$ | $$$$$$$ |$$ |  \__|$$ |  $$ |$$ |$$ |  $$ |$$ /  $$ |      \__|\__|
#               $$$  / \$$$ |$$  __$$ |$$ |      $$ |  $$ |$$ |$$ |  $$ |$$ |  $$ |              
# $$\ $$\       $$  /   \$$ |\$$$$$$$ |$$ |      $$ |  $$ |$$ |$$ |  $$ |\$$$$$$$ |      $$\ $$\ 
# \__|\__|      \__/     \__| \_______|\__|      \__|  \__|\__|\__|  \__| \____$$ |      \__|\__|
#                                                                        $$\   $$ |              
#                                                                        \$$$$$$  |              
#                                                                         \______/               
# Try to use it without any change in content...
sudo pacman -S git
git config --global init.defaultBranch main
git config --global user.email "abhishekrenjan33@gmail.com"
git config --global user.name "Ren-Gen22"

pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

sudo pacman -S nodejs npm zsh ttf-hack-nerd 
yay -S spaceship-prompt wlogout 

sudo pacman -S hypridle hyprlock hyprpaper waybar dunst polkit-kde-agent

sudo pacman -S firefox thunar neovim udisks2 viewnior zathura libreoffice-still github-cli network-manager-applet pavucontrol

sudo pacman -S wofi rofi cliphist vlc discord

sudo pacman -S xdg-user-dirs papirus-icon-theme libnotify imagemagick
xdg-user-dirs-update

#sudo pacman -S steam wine steam-native qbittorrent

sudo pacman -S adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji
sudo pacman -S ttf-dejavu ttf-liberation ttf-font-awesome ttf-material-design-icons
# fc-cache -fv # manual font installation

pacman -S fuse3 ntfs-3g os-prober
cd /etc/default/  diasable-os-prober-false


cd /usr/lib/sddm/sddm.conf.d
pacman -S qt5-graphicaleffects qt5-quickcontrols qt5-quickcontrols2

pacman -S bluez bluez-utils
sudo systemctl enable NetworkManager bluetooth



