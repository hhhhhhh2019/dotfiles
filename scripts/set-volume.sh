#!/bin/bash

if [[ $1 == "up" ]]; then
	pamixer -i 1
fi

if [[ $1 == "down" ]]; then
	pamixer -d 1
fi
