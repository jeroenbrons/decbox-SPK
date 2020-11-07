#!/bin/bash
#go to DECbox-root
cd ../../


#PDP11 installs
cd PDP11
#211bsd
cd 211bsd
wget https://pdp-11.org.ru/files/unix/211bsd.zip
gunzip 211bsd.tap.gz
cd ..
#rstse
cd rstse
wget  https://pdp-11.org.ru/files/rsts/rstsv9_lib.zip
unzip rstsv9_lib.zip
wget https://pdp-11.org.ru/files/rsts/rstsv96_ins.zip
unzip rstsv96_ins.zip
cd ..
#RSX11
cd rsx11
wget ftp://ftp.trailing-edge.com/pub/rsxdists/rsx11mplus_4_6_bl87_dsk.zip 
unzip rsx11mplus_4_6_bl87_dsk.zip.zip
cp rsx11mplus_4_6_bl87.dsk rsx11mpbl_mxf.dsk
cd ..
#rt11
cd rt11
wget https://pdp-11.org.ru/files/rt-11/rt11v503.zip
unzip rt11v503.zip
cd ..
#ultrix
cd ultrix
wget https://pdp-11.org.ru/files/unix/ultrix31.zip
unzip ultrix31.zip
cd ..
#PDP11 ready
cd ..

#PDP10 start
cd PDP10
#TOPS10
cd t10
wget https://www.steubentech.com/~talon/pdp10/tops10-1.4.tar.bz2
tar xvf tops10-1.4.tar.bz2
#TOPS20 PANDA (creates the directory)
wget http://panda.trailing-edge.com/panda-dist.tar.gz
tar xvf panda-dist.tar.gz
rm panda-dist.tar.gz
mv panda-dist panda
#PDP10 done
cd ..

#uVAX3900 
cd uVAX3900
#ultrix
cd utlrix
wget https://musall.de/mirrors/ultrix/ultrix_os/vax/ultrix-vax-4.5-mode1.ufs.bz2
bunzip2 ultrix-vax-4.5-mode1.ufs.bz2
mv ultrix-vax-os-v4.5.mode1.ufs ultrix-vax-os-v4.5.mode1.ufs.iso
ln -s ultrix-vax-os-v4.5.mode1.ufs.iso ../../VAX11/ultrix/ultrix-vax-os-v4.5.mode1.ufs.iso
cd ..
#VMS
echo "SKIPPING (OPEN)VMS BECAUSE OF COPYRIGHT!!!"
#quasuarus
cd quas
wget http://www.tavi.co.uk/unixhistory/quasijarus/quastape.zip
unzip quastape.zip
cd ..
#uVAX3900 done
cd ..
pwd
#VAX 11/780
cd VAX780
#ultrix
cd utlrix
wget https://musall.de/mirrors/ultrix/ultrix_os/vax/ultrix-vax-4.5-mode1.ufs.bz2
bunzip2 ultrix-vax-4.5-mode1.ufs.bz2
mv ultrix-vax-os-v4.5.mode1.ufs ultrix-vax-os-v4.5.mode1.ufs.iso
ln -s ultrix-vax-os-v4.5.mode1.ufs.iso ../../VAX11/ultrix/ultrix-vax-os-v4.5.mode1.ufs.iso
cd ..
#quas
cd quas
wget http://www.tavi.co.uk/unixhistory/quasijarus/quastape.zip
unzip quastape.zip
cd ..