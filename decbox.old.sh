#!/bin/bash

# while-menu: a menu-driven system information program

DELAY=3 # Number of seconds to display results

while true; do
  clear
  cat << _EOF_
Please Select:

1. VAX
2. PDP10
3. PDP11
0. Quit

_EOF_

  read -p "Enter selection [0-3] > "

  if [[ $REPLY =~ ^[0-3]$ ]]; then
    case $REPLY in
      1)
        ./vax.sh
        continue
        ;;
      2)
        ./PDP10.sh
        continue
        ;;
      3)
        ./PDP11.sh
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

