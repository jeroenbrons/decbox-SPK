#!/bin/bash




DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0



while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "DECbox by SPARCie" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select system:" $HEIGHT $WIDTH 4 \
    "1" "VAX/VMS 4" \
    "2" "OpenVMS 7.3" \
    "3" "Quasijarus 4.3" \
    "4" "Ultrix" \
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
      bash vms4.sh
      ;;
    2 )
      bash vms73.sh
      ;;
    3 )
      bash quas.sh
      ;;
    4 )
      bash ultrix.sh
      ;;
  esac
done 
