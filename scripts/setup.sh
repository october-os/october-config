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

# Setup Quickshell theme directory
mkdir quickshell/theme

# Setup Tuigreet
sed -i 's/command = "agreety --cmd $SHELL"/command = "tuigreet --cmd start-hyprland"/' /etc/greetd/config.toml

# Symlink everything to the right place
dotConfig="$HOME/.config"

ln -sf $PWD/hypr $dotConfig/hypr
ln -sf $PWD/kitty $dotConfig/kitty
ln -sf $PWD/quickshell $dotConfig/quickshell
ln -sf $PWD/swayosd $dotConfig/swayosd
ln -sf $PWD/wofi $dotConfig/wofi

# Copy templates to pywal templates
cp pywal/* $dotConfig/wal/templates/
