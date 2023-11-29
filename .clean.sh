#!/bin/bash

# Check if the script is run with sudo
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Please use sudo." 
   exit 1
fi

# Remove orphaned packages
pacman -Rns $(pacman -Qdtq) --noconfirm

# Clean package cache
paccache -r

# Clean journal logs
journalctl --vacuum-size=50M
journalctl --vacuum-time=7d

# Remove temporary files
rm -rf /tmp/*
rm -rf /var/tmp/*
rm -f .*.tmp

# Clean user cache directories
rm -rf ~/.cache/*

# Remove old cached versions of installed packages and downloaded files
yay -Sc --noconfirm

# Remove uninstalled packages from the cache
yay -Yc --noconfirm

# Clean Chrome data
rm -rf ~/.config/chromium/Default/Cache/*
rm -rf ~/.config/chromium/Default/Media\ Cache/*
rm -rf ~/.config/chromium/Default/IndexedDB/*
rm -rf ~/.config/chromium/Default/Service\ Worker/CacheStorage/*

echo "Cleanup completed!"
