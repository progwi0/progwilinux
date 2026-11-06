#!/bin/sh

alias dialog='dialog --backtitle "Progwilinux Package Installer / by progwi0"'

dialog --title "Hello!" --msgbox "Welcome to Progwilinux Package Installer. This small script helps you to install required packages to your Progwilinux build!" 9 30

sbundle=$(dialog --title "Software bundle choosing." --radiolist "Select software bundle." 11 40 12 1 "Default" on 2 "Basic" off 3 "Full" off 4 "Custom" off 3>&1 1>&2 2>&3)

if [ $? -ne 0 ] || [ -z "$sbundle" ]; then
    clear
    echo "Installation canceled."
    exit 1
fi

if [ "$sbundle" = "1" ]; then
    packages="coreutils filesystem glibc superfile lazygit tmux btop neovim pacman eza zoxide dust duf fd w3m tgpt linux-firmware ruby"
elif [ "$sbundle" = "2" ]; then
    packages="coreutils filesystem glibc superfile tmux vim pacman eza zoxide dust duf fd linux-firmware ruby"
elif [ "$sbundle" = "3" ]; then
    packages="coreutils filesystem glibc superfile lazygit tmux btop neovim pacman eza zoxide dust duf fd gcc rust crystal python w3m tgpt linux-firmware taskwarrior-tui ruby"
elif [ "$sbundle" = "4" ]; then
    packages=$(dialog --title "Software bundle choosing." --inputbox "Select software bundle." 7 40 "coreutils filesystem glibc superfile tmux vim pacman eza zoxide dust duf fd linux-firmware ruby" 3>&1 1>&2 2>&3)

    if [ $? -ne 0 ] || [ -z "$packages" ]; then
        clear
        echo "Custom package selection canceled."
        exit 1
    fi
fi

# initus=$(dialog --title "Init choosing." --radiolist "Select initialization program." 10 40 12 1 "systemd" on 2 "openrc" off 3 "Simple init script" off 3>&1 1>&2 2>&3)

mkdir -p tmp/var/lib/pacman

sudo pacman -r tmp --disable-sandbox -Sy $packages --noconfirm
