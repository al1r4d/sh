#!/bin/bash

choices="laptop\nfhd\nhd+"
chosen=$(echo -e "$choices" | dmenu -i)

case "$chosen" in
	laptop) autorandr -l laptop && feh --bg-fill /home/a/Downloads/wallpaper.jpg ;;
	fhd) autorandr -l fhd && feh --bg-fill /home/a/Downloads/wallpaper.jpg ;;
	hd+) autorandr -l hd+ ;;
esac
