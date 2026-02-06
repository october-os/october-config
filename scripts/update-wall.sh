#!/bin/bash

configDir=$HOME/.config

randomWallpaper=$(ls "$configDir/wallpapers" | shuf -n 1)

mkdir -p /tmp/october-config
touch "/tmp/october-config/lastwallpaper"

while [ "$randomWallpaper" = $(cat /tmp/october-config/lastwallpaper) ]
do
    randomWallpaper=$(ls "$configDir/wallpapers" | shuf -n 1)
done

echo -n "$randomWallpaper" > /tmp/october-config/lastwallpaper

swww img --transition-type wave --transition-fps 120 --transition-duration 1.5 $configDir/wallpapers/$randomWallpaper

wal -n -q -i "$configDir/wallpapers/$randomWallpaper"
cp $HOME/.cache/wal/wallpaper-template.qml $configDir/quickshell/theme/Theme.qml
cp $HOME/.cache/wal/colors-kitty.conf ~/.config/kitty
