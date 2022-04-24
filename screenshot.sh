#!/bin/bash
pilihan="copy\narea"
kepilih=$(echo -e "$pilihan" | dmenu -i)

case "$kepilih" in
	copy) scrot '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f' ;;
	area) scrot '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f' -s ;;

	esac
