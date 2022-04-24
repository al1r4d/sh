#!/bin/bash

choices="poweroff\nreboot\nlogoutdwm"
chosen=$(echo -e "$choices" | dmenu -i)

case "$chosen" in
	poweroff) loginctl poweroff ;;
	reboot) loginctl reboot ;;
	logoutdwm) pkill dwm ;;
esac
