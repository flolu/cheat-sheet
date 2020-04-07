#!/bin/bash  
readonly DIRECTORY=/etc/X11/xorg.conf.d
readonly FILENAME=50-vmmouse.conf

mkdir $DIRECTORY -p &&
cat ./fix-mouse.txt > $DIRECTORY/$FILENAME