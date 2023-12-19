#!/usr/bin/bash


swww_flags="--transition-fps 120 --transition-step 90 -t wipe"


init () {
	swww init
}


set () {
	init

	swww img $swww_flags "$HOME/.wallpapers/$1"

	echo "$1" > "$HOME/.last_wallpaper"
}


random () {
	last_wallpaper=$(cat "$HOME/.last_wallpaper")
	wallpaper=$(ls "$HOME/.wallpapers" | sort -R | head -1)

	while [ "$last_wallpaper" == "$wallpaper" ]; do
		wallpaper=$(ls "$HOME/.wallpapers" | sort -R | head -1)
	done

	set "$wallpaper"
}


restore () {
	if [ ! -f "$HOME/.last_wallpaper" ]; then
		return
	fi

	wallpaper=$(cat "$HOME/.last_wallpaper")

	init

	swww img -t none "$HOME/.wallpapers/$wallpaper"
}


rofi_select () {
	result=$(

	ls -1 "$HOME/.wallpapers" | while read A; do
		echo -en "$A\x00icon\x1f~/.wallpapers/$A\n"
	done | rofi -dmenu -theme $HOME/.config/rofi/launchers/type-2/style-8.rasi )

	set $result
}


"$@"
