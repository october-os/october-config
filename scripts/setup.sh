#!/bin/bash

# Pull wallpaper
defaultWallpaperLink="https://raw.githubusercontent.com/october-os/october-assets/refs/heads/main/october-wallpapers/logo-text-bottom-small.png"
curl $defaultWallpaperLink -o wallpapers/wallpaper.png

# Pull default profile picture
defaultPfp="https://raw.githubusercontent.com/october-os/october-assets/refs/heads/main/october-logo-background.png"
curl $defaultPfp -o profile_picture.jpg

# Setup Hyprland user config
mkdir hypr/user
touch hypr/user/hyprland.conf
