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
    "1" "MIT ITS" \
    "2" "TOPS-10" \
    "3" "TOPS-20" \
    "3" "TOPS-20 Panda distro" \
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
      bash its.sh
      ;;
    2 )
      bash t10.sh
      ;;
    3 )
      bash t20.sh
      ;;
    4 )
      bash panda.sh
      ;;
  esac
done 
