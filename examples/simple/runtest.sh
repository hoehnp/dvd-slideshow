#!/bin/bash

# first, let's clean out any old example files:
check_rm () {
        if [ -f "$1" ] ; then
                rm "$1"
        fi
}

echo "[runtest.sh] Removing old files..."
check_rm simple.xml
check_rm simple.vob
check_rm simple.flv
check_rm simple.log
check_rm dvd-menu.log
check_rm vmgm.xml
check_rm menu.vob
check_rm menu.xml
rm -rf dvd_fs  

echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-slideshow -f simple.txt $*"
echo " "
dvd-slideshow -f simple.txt $*

if [ ! -f "simple.xml" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-slideshow!"
        echo "[runtest.sh]      This means something major failed in dvd-slideshow"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-menu -t 'Test simple' -f simple.xml -n 'Simple DVD' $*"
dvd-menu -t 'Test simple' -f simple.xml -n 'Simple DVD' $*

if [ ! -f "vmgm.xml" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-menu!"
        echo "[runtest.sh]      This means something major failed in dvd-menu"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

#uncomment the following lines if you want:
#xine -g -u 0 dvd:"`pwd`/dvd_fs/"  &

