#!/bin/bash

# Pull wallpaper
defaultWallpaperLink="https://w.wallhaven.cc/full/m3/wallhaven-m3y1j9.png"

curl $defaultWallpaperLink -o wallpapers/wallpaper.png

# Setup Hyprland user config
mkdir hypr/user
touch hypr/user/hyprland.conf
