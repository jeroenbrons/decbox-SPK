#!/bin/bash




DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0


while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "2.11 BSD menu" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select config:" $HEIGHT $WIDTH 4 \
    "1" "install" \
    "2" "normal run" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      pdp11 install.ini
      ;;
    2 )
      pdp11 pdp11.ini
      ;;
  esac
done 
