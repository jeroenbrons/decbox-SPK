#!/bin/bash

cd PDP10/
git clone https://github.com/PDP-10/its.git
cd its
make EMULATOR=klh10
