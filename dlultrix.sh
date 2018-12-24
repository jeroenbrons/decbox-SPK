#!/bin/bash
cd uVAX/utlrix
wget https://musall.de/mirrors/ultrix/ultrix_os/vax/ultrix-vax-4.5-mode1.ufs.bz2
bunzip2 ultrix-vax-4.5-mode1.ufs.bz2
mv ultrix-vax-os-v4.5.mode1.ufs ultrix-vax-os-v4.5.mode1.ufs.iso
ln -s ultrix-vax-os-v4.5.mode1.ufs.iso ../../VAX11/ultrix/ultrix-vax-os-v4.5.mode1.ufs.iso
