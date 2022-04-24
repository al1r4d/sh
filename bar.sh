#!/bin/bash

interval=0

suhu() {
	printf "$(sed 's/000$/°C/' /sys/class/thermal/thermal_zone0/temp)"
}

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)


  printf "$cpu_val"
}

suara() {
	printf "$(amixer get Master | awk -F'[][]' 'END{ print $2 }')"
}

musik() {
	
	printf "$(playerctl --player=spotify,mpd metadata title)"
}

fan() {
	
	printf "$(cat /proc/acpi/ibm/fan | awk 'NR==2 {print $2}')"
}
# battery
batt() {
	printf "$(acpi | sed "s/,//g" | awk '{if ($3 == "Discharging"){print $4; exit} else {print $4}}' | tr -d "\n")"
}

mem() {
  printf "$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
  case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
  up) printf "up" ;;
  down) printf "down" ;;
  esac
}

clock() {
printf "$(date '+%a, %d %b %y, %I:%M:%S%p') "
}

while true; do

  [ $interval == 0 ] || [ $(($interval % 3600)) == 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name " $(suhu) | $(fan) | $(batt) | $(suara) | $(wlan) | $(clock)"
done
