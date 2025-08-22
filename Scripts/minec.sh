#!/bin/bash
export LIBVA_DRIVER_NAME=nvidia
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1
export WLR_RENDERER=vulkan
export WLR_DRM_NO_ATOMIC=1

env -u WAYLAND_DISPLAY DRI_PRIME=1 \
java -jar ~/Desktop/Abhi/Fav/.gmz/TLauncher.jar
