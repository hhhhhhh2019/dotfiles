#!/bin/bash

while true; do
	hyprctl dispatch resizeactive "$1" "$2"
done;
