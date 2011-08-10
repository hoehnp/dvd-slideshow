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
check_rm 'my_slideshow.xml'
check_rm 'my_slideshow.vob'
check_rm 'my_slideshow.log'
check_rm dvd-menu.log
check_rm vmgm.xml
check_rm menu.vob
check_rm menu.xml

echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-slideshow -f 'my_slideshow.txt' $*"
echo " "
dvd-slideshow -f my_slideshow.txt $*
echo " "

if [ ! -f "my_slideshow.vob" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-slideshow!"
        echo "[runtest.sh]      This means something major failed in dvd-slideshow"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-menu -e ../images/picture1.jpg -t 'My slideshow' -f my_slideshow.xml -n 'my slideshow dvd' $*"
dvd-menu -e "../images/picture1.jpg" -t 'My slideshow' -f my_slideshow.xml -n 'my slideshow dvd' $*

if [ ! -f "menu.vob" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-menu!"
        echo "[runtest.sh]      This means something major failed in dvd-menu"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

#xine -g -u 0 dvd:"`pwd`/dvd_fs/"  &
#mplayer -sid 0


