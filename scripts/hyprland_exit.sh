#!/usr/bin/bash

sync

killall xdg-desktop-portal
sleep 1

hyprctl dispatch exit
sleep 1
pidof Hyprland && killall Hyprland
