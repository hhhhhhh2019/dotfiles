#!/bin/bash

mode=$(dbus-send --session --print-reply=literal --reply-timeout=1000 --dest=org.freedesktop.portal.Desktop /org/freedesktop/portal/desktop org.freedesktop.portal.Settings.Read string:'org.freedesktop.appearance' string:'color-scheme' | tail -c2)

CONFIG="$HOME/.config/kitty/"

rm -f "$CONFIG/theme.conf"

if [ "$mode" == "1" ]; then
 ln -s "$CONFIG/mocha.conf" "$CONFIG/theme.conf"
else
 ln -s "$CONFIG/latte.conf" "$CONFIG/theme.conf"
fi

kitty @ action load_config_file
