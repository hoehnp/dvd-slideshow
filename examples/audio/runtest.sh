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
check_rm audio.xml
check_rm audio.vob
check_rm dvd-slideshow.log
check_rm dvd-menu.log
check_rm vmgm.xml
check_rm menu.vob
check_rm menu.xml
rm -rf dvd_fs  # from the older examples

echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-slideshow -f audio.txt $*"
echo " "
dvd-slideshow -f audio.txt $*
echo " "

if [ ! -f "audio.xml" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-slideshow!"
        echo "[runtest.sh]      This means something major failed in dvd-slideshow"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-menu -b background.jpg -t 'audio' -f audio.xml -n 'Audio DVD' $*"
dvd-menu -t 'Test audio' -f audio.xml -n 'Audio DVD' $*

if [ ! -f "vmgm.xml" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-menu!"
        echo "[runtest.sh]      This means something major failed in dvd-menu"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

#############################################

#xine -g -u 0 dvd:"`pwd`/dvd_fs/"  &


