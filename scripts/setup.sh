#!/bin/bash

dotConfig="$HOME/.config"
octoberConfigDir="$dotConfig/october-config"

# Setup wallpapers directory
mkdir $octoberConfigDir/wallpapers

# Pull wallpaper
defaultWallpaperLink="https://raw.githubusercontent.com/october-os/october-assets/refs/heads/main/october-wallpapers/logo-text-bottom-small.png"
curl $defaultWallpaperLink -o $octoberConfigDir/wallpapers/wallpaper.png

# Pull default profile picture
defaultPfp="https://raw.githubusercontent.com/october-os/october-assets/refs/heads/main/october-logo-background.png"
curl $defaultPfp -o $octoberConfigDir/profile_picture.jpg

# Setup Hyprland user config
mkdir $octoberConfigDir/hypr/user
touch $octoberConfigDir/hypr/user/hyprland.conf

# Setup Quickshell theme directory
mkdir $octoberConfigDir/quickshell/theme

# Symlink everything to the right place
ln -sf $octoberConfigDir/hypr $dotConfig/hypr
ln -sf $octoberConfigDir/kitty $dotConfig/kitty
ln -sf $octoberConfigDir/quickshell $dotConfig/quickshell
ln -sf $octoberConfigDir/swayosd $dotConfig/swayosd
ln -sf $octoberConfigDir/wofi $dotConfig/wofi

# Copy templates to pywal templates
cp $octoberConfigDir/pywal/* $dotConfig/wal/templates/

# Setup styles directory
mkdir $octoberConfigDir/styles
