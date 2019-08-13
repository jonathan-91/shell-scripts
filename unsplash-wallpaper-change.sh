#!/bin/bash
# Download random unsplash wallpaper & set it on Gnome
# Add to cron to automatically change at 5 AM
#0 5 * * * sh  /path/to/script/unsplash-wallpaper-change.sh > /dev/null 2>&1 &


# Keep last five wallpapers
mv -f $HOME/Pictures/unsplash04.jpg $HOME/Pictures/unsplash05.jpg
mv -f $HOME/Pictures/unsplash03.jpg $HOME/Pictures/unsplash04.jpg
mv -f $HOME/Pictures/unsplash02.jpg $HOME/Pictures/unsplash03.jpg
mv -f $HOME/Pictures/unsplash01.jpg $HOME/Pictures/unsplash02.jpg

# Get new wallpaper
wget -O $HOME/Pictures/unsplash01.jpg https://unsplash.it/2560/1440/?random

# Set wallpaper
gsettings set org.gnome.desktop.background picture-uri file://$HOME/Pictures/unsplash01.jpg
