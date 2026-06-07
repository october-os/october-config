#!/bin/bash

randomWallpaper=$1
configDir=$HOME/.config/october-config

wal -n -q -i "$configDir/wallpapers/$randomWallpaper" --backend colorthief
cp $HOME/.cache/wal/quickshell-template.qml $configDir/quickshell/theme/Theme.qml
cp $HOME/.cache/wal/hypr-template.lua $configDir/hypr/base/colors.lua
cp $HOME/.cache/wal/hypr-template.conf $configDir/hypr/base/colors.conf
cp $HOME/.cache/wal/colors-kitty.conf ~/.config/kitty
cp $HOME/.cache/wal/colors.css $configDir/swayosd/colors.css
cp $HOME/.cache/wal/colors.css $configDir/styles/colors.css
cp $HOME/.cache/wal/gtk-template.css $configDir/styles/gtk.css
