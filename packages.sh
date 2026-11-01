#!/bin/sh

alias dialog='dialog --backtitle "Progwilinux Package Installer / by progwi0"'

dialog --title "Hello!" --msgbox "Welcome to Progwilinux Package Installer. This small script helps you to install required packages to your Progwilinux build!" 9 30

sbundle=$(dialog --title "Software bundle choosing." --radiolist "Select software bundle." 10 40 12 1 "Default" on 2 "Basic" off 3 "Full" off 3>&1 1>&2 2>&3)

if [ "$sbundle" = "1" ]; then
    PACKAGES="busybox filesystem glibc dash ncurses mc htop dialog nano"
elif [ "$sbundle" = "2" ]; then
    PACKAGES="busybox filesystem glibc dash mc nano"
elif [ "$sbundle" = "3" ]; then
    PACKAGES="busybox filesystem glibc dash ncurses mc htop dialog nano gcc ruby"
fi