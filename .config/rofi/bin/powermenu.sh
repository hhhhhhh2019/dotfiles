#!/bin/bash

RESULT=$(printf "poweroff\nreboot\nsuspend\nhybrid-sleep" | rofi -dmenu "$@")

systemctl "$RESULT"
