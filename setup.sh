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
# Optimized with default shell change.

yecho(){ # Function for yellow text
    echo -e "\e[93;1m$@\e[0m"
}

recho(){ # red text
	echo -e "\e[93;31m$@\e[0m"
}
# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
    recho "Please run as root (e.g., sudo $0)"
    exit 1
fi

# Git installation and configuration
sudo pacman -S --noconfirm git
git config --global init.defaultBranch main
# Uncomment and configure Git user if needed
# git config --global user.email "abhishekrenjan33@gmail.com"
# git config --global user.name "Ren-Gen22"

yecho "Starting to install basic packages..."

# Audio and multimedia
sudo pacman -S --noconfirm pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber

# yayyyyy!!!!! 
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
cd ..
rm -rf yay

# Basic utilities
sudo pacman -S --noconfirm nodejs npm zsh ttf-hack-nerd
yay -S --noconfirm spaceship-prompt wlogout


# Hyprland-related packages
sudo pacman -S --noconfirm hypridle hyprlock hyprpaper waybar dunst polkit-kde-agent

# General utilities
sudo pacman -S --noconfirm \
    firefox thunar neovim udisks2 viewnior zathura libreoffice-still github-cli \
    network-manager-applet pavucontrol wofi rofi cliphist vlc discord

# Additional utilities and system tweaks
sudo pacman -S --noconfirm xdg-user-dirs papirus-icon-theme libnotify imagemagick
xdg-user-dirs-update

# Font packages
sudo pacman -S --noconfirm \
    adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts \
    noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-liberation ttf-font-awesome \
    ttf-material-design-icons
# Adding installed fonts
fc-cache -fv

# Filesystem utilities
sudo pacman -S --noconfirm fuse3 ntfs-3g

# Custom SDDM theme setup
yecho "Applying Custom SDDM Theme"
sudo cp -r ./custom /usr/share/sddm/themes/
sudo sed -i 's/^Current=.*/Current=custom/' /usr/lib/sddm/sddm.conf.d/default.conf
sudo pacman -S --noconfirm qt5-graphicaleffects qt5-quickcontrols qt5-quickcontrols2

# Bluetooth setup
sudo pacman -S --noconfirm bluez bluez-utils
sudo systemctl enable --now NetworkManager bluetooth

yecho "Copying config files to ~/.config..."
cp -r ./configs/* $HOME/.config 

yecho "Setting ur default shell to Zsh"
# Change the default shell to Zsh
chsh -s $(which zsh)

sudo chmod +x ./sfr/sfr.sh
yecho "Setup completed successfully! Re-login to apply Zsh as your default shell."

echo "Ready for a surprise!!!"
echo "In 3.."
sleep 1
echo "2.."
sleep 1
echo "1"

clear
./sfr/sfr.sh
