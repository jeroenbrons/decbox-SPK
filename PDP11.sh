#!/bin/bash

# while-menu: a menu-driven system information program

DELAY=3 # Number of seconds to display results

while true; do
  clear
  cat << _EOF_
Please Select:

1. RT11
2. 2.11BSD
3. RSX11M 4.6 plus
0. Quit

_EOF_

  read -p "Enter selection [0-3] > "

  if [[ $REPLY =~ ^[0-3]$ ]]; then
    case $REPLY in
      1)
        cd pdp11/rt11
	pdp11
        continue
        ;;
      2)
        cd pdp11/bsd
	pdp11
        continue
        ;;
      3)
        cd pdp11/rsx11m
	pdp11
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

