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

yecho(){ # Yellow text
	echo -e "\e[93;1m$@\e[0m"
}

# git gud
sudo pacman -S git

git config --global init.defaultBranch main
# git config --global user.email "abhishekrenjan33@gmail.com"
# git config --global user.name "Ren-Gen22"


echo "Starting to Install basic packages"
#Audio
sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber

#yay!!
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

#basic
sudo pacman -S nodejs npm zsh ttf-hack-nerd 
yay -S spaceship-prompt wlogout 

#Hypr needs
sudo pacman -S hypridle hyprlock hyprpaper waybar dunst polkit-kde-agent

#General utils
sudo pacman -S firefox thunar neovim udisks2 viewnior zathura libreoffice-still github-cli network-manager-applet pavucontrol

sudo pacman -S wofi rofi cliphist vlc discord

sudo pacman -S xdg-user-dirs papirus-icon-theme libnotify imagemagick
xdg-user-dirs-update

#sudo pacman -S steam wine steam-native qbittorrent # maybe if ya want uncomment this line

sudo pacman -S adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji
sudo pacman -S ttf-dejavu ttf-liberation ttf-font-awesome ttf-material-design-icons
fc-cache -fv # font installation

sudo pacman -S fuse3 ntfs-3g 

# os-prober
# cd /etc/default/  diasable-os-prober-false

sudo cp -r ./custom /usr/share/sddm/themes/
yecho "goto /usr/lib/sddm/sddm.conf.d/default.conf and line 40 after [Theme] change \"Current=custom\""
pacman -S qt5-graphicaleffects qt5-quickcontrols qt5-quickcontrols2

sudo pacman -S bluez bluez-utils
sudo systemctl enable NetworkManager bluetooth

echo "Copying Config Files..."

cp ./dunst/ ./gtk-3.0/ ./hypr/ ./kitty/ ./neofetch/ ./nvim/ ./waybar/ ./wofi/ $HOME/.config

