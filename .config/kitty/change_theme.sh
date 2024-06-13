#!/bin/bash

mode=$(dbus-send --session --print-reply=literal --reply-timeout=1000 --dest=org.freedesktop.portal.Desktop /org/freedesktop/portal/desktop org.freedesktop.portal.Settings.Read string:'org.freedesktop.appearance' string:'color-scheme' | tail -c2)

rm -f theme.conf

if [ "$mode" == "2" ]; then
 ln -s latte.conf theme.conf
else
 ln -s mocha.conf theme.conf
fi
