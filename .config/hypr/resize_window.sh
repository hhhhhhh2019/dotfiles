#!/bin/bash

for _ in {1..20}; do
	hyprctl dispatch resizeactive "$1" "$2"
	sleep 0.001
done
