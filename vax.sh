#!/bin/bash

# while-menu: a menu-driven system information program

DELAY=3 # Number of seconds to display results

while true; do
  clear
  cat << _EOF_
Please Select:

1. VMS 7.3 hyuna
2. VMS 5.5.2 mina
3. VMS 4.7 choa
0. Quit

_EOF_

  read -p "Enter selection [0-3] > "

  if [[ $REPLY =~ ^[0-3]$ ]]; then
    case $REPLY in
      1)
        cd vax/hyuna
	vax
        continue
        ;;
      2)
	cd vax/mina
	./vax
        continue
        ;;
      3)
        cd vax/choa
	./vax
        continue
        ;;
      0)
        break
        ;;
    esac
  else
    echo "Invalid entry."
    sleep $DELAY
  fi
done
echo "Program terminated."

