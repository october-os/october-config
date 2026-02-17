#!/bin/bash

configDir=$HOME/.config/october-config

randomWallpaper=$(ls "$configDir/wallpapers" | shuf -n 1)

mkdir -p /tmp/october-config
touch "/tmp/october-config/lastwallpaper"

if [ $(ls -1q $configDir/wallpapers | wc -l) != "1" ]; then
    while [ "$randomWallpaper" = $(cat /tmp/october-config/lastwallpaper) ]
    do
        randomWallpaper=$(ls "$configDir/wallpapers" | shuf -n 1)
    done
fi

echo -n "$randomWallpaper" > /tmp/october-config/lastwallpaper

swww img --transition-type wave --transition-fps 120 --transition-duration 1.5 $configDir/wallpapers/$randomWallpaper

wal -n -q -i "$configDir/wallpapers/$randomWallpaper"
cp $HOME/.cache/wal/quickshell-template.qml $configDir/quickshell/theme/Theme.qml
cp $HOME/.cache/wal/hyprland-template.conf $configDir/hypr/colors.conf
cp $HOME/.cache/wal/colors-kitty.conf ~/.config/kitty
cp $HOME/.cache/wal/colors.css $configDir/styles/colors.css
cp $HOME/.cache/wal/colors.css $configDir/wofi/
