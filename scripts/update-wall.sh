#!/bin/bash

configDir=$HOME/.config/quickshell

file=$(ls "$configDir/wallpapers" | shuf -n 1)

sed -i "s|wallpapers/[^\"]*|wallpapers/"$file"|" "$configDir"/Background.qml

wal -q -i "$configDir/wallpapers/$file"
cp $HOME/.cache/wal/wallpaper-template.qml $configDir/theme/Theme.qml
cp $HOME/.cache/wal/colors-kitty.conf ~/.config/kitty
