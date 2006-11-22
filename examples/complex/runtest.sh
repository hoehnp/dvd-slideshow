#!/bin/bash

## pass additional arguments for you own system.  Examples:
# runtest.sh -p -L
# for a low-quality pal video...  Those arguments will just get passed
# to dvd-slideshow and dvd-menu

# first, let's clean out any old example files:
check_rm () {
        if [ -f "$1" ] ; then
                rm "$1"
        fi
}

echo "[runtest.sh] Removing old files..."
check_rm complex.xml
check_rm complex.vob
check_rm dvd-slideshow.log
check_rm dvd-menu.log
check_rm vmgm.xml
check_rm menu.vob
check_rm menu.xml
rm -rf dvd_fs  

echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-slideshow -f complex.txt $*"
echo " "
time dvd-slideshow -f complex.txt $*
echo " "

if [ ! -f "complex.xml" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-slideshow!"
        echo "[runtest.sh]      This means something major failed in dvd-slideshow"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-menu -b background.jpg -t 'Test complex' -f complex.xml -n 'Complex DVD' $*"
dvd-menu -b ../images/background.jpg -t 'Test complex' -f complex.xml -n 'Complex DVD' $*

if [ ! -f "vmgm.xml" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-menu!"
        echo "[runtest.sh]      This means something major failed in dvd-menu"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

#xine -g -u 0 dvd:"`pwd`/dvd_fs/"  &
#mplayer -sid 0


