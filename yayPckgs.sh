#!/bin/bash

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
cd ..
rm -rf yay

yay -S --noconfirm spaceship-prompt wlogout
