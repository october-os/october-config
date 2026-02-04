#!/bin/bash

configDir=$HOME/.config

file=$(ls "$configDir/wallpapers" | shuf -n 1)

swww img --transition-type wave --transition-fps 120 --transition-duration 1.5 $configDir/wallpapers/$file

wal -q -i "$configDir/wallpapers/$file"
cp $HOME/.cache/wal/wallpaper-template.qml $configDir/quickshell/theme/Theme.qml
cp $HOME/.cache/wal/colors-kitty.conf ~/.config/kitty
