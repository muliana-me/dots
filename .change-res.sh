#!/bin/bash

current_resolution=$(xrandr | awk '/\*/ {print $1}')
update_wallpaper() { feh --bg-fill ~/pictures/silent_mountains_5k.jpg; }

if [ "$current_resolution" = "1280x720" ]; then
    xrandr --output eDP-1 --mode 1920x1080
    update_wallpaper
    echo "Screen resolution changed to 1920x1080."
elif [ "$current_resolution" = "1920x1080" ]; then
    xrandr --output eDP-1 --mode 1280x720
    update_wallpaper
    echo "Screen resolution changed to 1280x720."
else
    echo "No screen resolution change needed."
fi

