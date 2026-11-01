#!/bin/sh

alias dialog='dialog --backtitle "Progwilinux Package Installer / by progwi0"'

dialog --title "Hello!" --msgbox "Welcome to Progwilinux Package Installer. This small script helps you to install required packages to your Progwilinux build!" 9 30

sbundle=$(dialog --title "Software bundle choosing." --radiolist "Select software bundle." 10 40 12 1 "Default" on 2 "Basic" off 3 "Full" off 4 "Custom" off 3>&1 1>&2 2>&3)

if [ $? -ne 0 ] || [ -z "$sbundle" ]; then
    clear
    echo "Installation canceled."
    exit 1
fi

if [ "$sbundle" = "1" ]; then
    packages="busybox filesystem glibc dash ncurses mc htop dialog nano"
elif [ "$sbundle" = "2" ]; then
    packages="busybox filesystem glibc dash mc nano"
elif [ "$sbundle" = "3" ]; then
    packages="busybox filesystem glibc dash ncurses mc htop dialog nano gcc ruby"
elif [ "$sbundle" = "4" ]; then
    packages=$(dialog --title "Software bundle choosing." --inputbox "Select software bundle." 7 40 "busybox filesystem glibc dash mc nano" 3>&1 1>&2 2>&3)

    if [ $? -ne 0 ] || [ -z "$packages" ]; then
        clear
        echo "Custom package selection canceled."
        exit 1
    fi
fi

mkdir -p tmp/var/lib/pacman

sudo pacman -r tmp --disable-sandbox -Sy $packages --noconfirm