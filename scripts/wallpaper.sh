#!/usr/bin/bash


swww_flags=(--transition-fps 120 --transition-step 90 -t wipe)


init () {
	swww init
}


set () {
	init

	swww img "${swww_flags[@]}" "$HOME/.wallpapers/$1"

	echo "${swww_flags[@]}"

	echo "$1" > "$HOME/.last_wallpaper"
}


random () {
	last_wallpaper=$(cat "$HOME/.last_wallpaper")
	wallpaper=$(find "$HOME/.wallpapers/" -type f | shuf -n 1)

	while [ "$last_wallpaper" == "$wallpaper" ]; do
		wallpaper=$(find "$HOME/.wallpapers/" -type f | shuf -n 1)
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

	find "$HOME/.wallpapers/" -type f -printf "%f\n" | while read -r A; do
		echo -en "$A\x00icon\x1f~/.wallpapers/$A\n"
	done | rofi -dmenu -theme "$HOME/.config/rofi/launchers/type-2/style-8.rasi" )

	set "$result"
}


"$@"
