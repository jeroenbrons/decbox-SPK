#!/bin/bash
cd PDP11/rsx11
wget ftp://ftp.trailing-edge.com/pub/rsxdists/rsx11mplus_4_6_bl87_dsk.zip 
unzip ftp://ftp.trailing-edge.com/pub/rsxdists/rsx11mplus_4_6_bl87_dsk.zip.zip
cp rsx11mplus_4_6_bl87.dsk rsx11mpbl_mxf.dsk
cd ../..

cd PDP10/t10
wget https://www.steubentech.com/~talon/pdp10/tops10-1.4.tar.bz2
tar xvf tops10-1.4.tar.bz2
