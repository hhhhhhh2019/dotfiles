#!/usr/bin/bash

if [[ "$(mpc status)" == *"[paused]"* ]]; then
	echo ""
else
	echo "󰏤"
fi
