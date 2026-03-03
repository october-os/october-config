#!/bin/bash

configDir=$HOME/.config/october-config

randomWallpaper=$(ls "$configDir/wallpapers" | shuf -n 1)

mkdir -p /tmp/october-config
if [ ! -f /tmp/october-config/lastwallpaper ]; then
    echo october > /tmp/october-config/lastwallpaper
fi
touch "/tmp/october-config/lastwallpaper"

if [ $(ls -1q $configDir/wallpapers | wc -l) != "1" ]; then
    while [ "$randomWallpaper" == $(cat /tmp/october-config/lastwallpaper) ]
    do
        randomWallpaper=$(ls "$configDir/wallpapers" | shuf -n 1)
    done
fi

echo -n "$randomWallpaper" > /tmp/october-config/lastwallpaper

swww img --transition-type wave --transition-fps 120 --transition-duration 1.5 $configDir/wallpapers/$randomWallpaper

($configDir/scripts/gen-color.sh $randomWallpaper)

pkill swayosd-server
nohup swayosd-server >/dev/null 2>&1 &
