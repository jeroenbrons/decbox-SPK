#!/bin/bash




DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0



while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "PDP-11 mode" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select system:" $HEIGHT $WIDTH 4 \
    "1" "RT-11" \
    "2" "RSTS-E" \
    "3" "Research UNIX v1" \
    "4" "Ultrix" \
    "5" "RSX-11" \
    "6" "2.11 BSD" \
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
      bash rt-11.sh
      ;;
    2 )
      bash rsts-e.sh
      ;;
    3 )
      bash unix1-11.sh
      ;;
    4 )
      bash ultrix-11.sh
      ;;
    5 )
      bash rsx-11.sh
      ;;
    6 )
      bash 2-11bsd.sh
      ;;
  esac
done 
