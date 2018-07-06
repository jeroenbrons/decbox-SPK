#!/bin/bash

# while-menu: a menu-driven system information program

DELAY=3 # Number of seconds to display results

while true; do
  clear
  cat << _EOF_
Please Select:

1. ITS
2. TOPS-20
3. TOPS-10
0. Quit

_EOF_

  read -p "Enter selection [0-3] > "

  if [[ $REPLY =~ ^[0-3]$ ]]; then
    case $REPLY in
      1)
        cd pdp10/its
	pdp10
        continue
        ;;
      2)
        cd pdp10/t20
	pdp10
        continue
        ;;
      3)
        cd pdp10/t20
	pdp10
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

