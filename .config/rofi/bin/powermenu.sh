#!/bin/bash

RESULT=$(printf "poweroff\nreboot\nsuspend" | rofi -dmenu "$@")

systemctl "$RESULT"
