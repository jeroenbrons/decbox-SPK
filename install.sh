#!/bin/bash




DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0



while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "DECbox by SPARCie INSTALL menu" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select which systems to install:" $HEIGHT $WIDTH 4 \
    "1" "RSX-11" \
    "2" "ultrix-VAX" \
    "3" "TOPS-10" \
    "4" "TOPS-20 PANDA" \
    "5" "Quasjarius BSD" \
    "6" "MIT ITS from Github" \
    "7" "Ultrix-11" \
    "8" "2.11 BSD" \
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
      bash dlrsx11.sh
      ;;
    2 )
      bash dlultrix.sh
      ;;
    3 )
      bash dlt10.sh
      ;;
    4 )
      bash dlpanda.sh
      ;;
    5 )
      bash dlquas.sh
      ;;
    6 )
      bash itsinst.sh
      ;;
    7 )
      bash dlultrix11.sh
      ;;
    8 )
      bash dl211bsd.sh
      ;;
  esac
done
