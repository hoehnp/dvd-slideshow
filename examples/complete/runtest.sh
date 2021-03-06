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
check_rm 'test complete.xml'
check_rm 'test complete.vob'
check_rm 'test complete.log'
check_rm dvd-menu.log
check_rm vmgm.xml
check_rm menu.vob
check_rm menu.xml
rm -rf dvd_fs_complete  # from the older examples

mkdir my_pictures
ln -s ../../images/flower1.jpg my_pictures/flower1.jpg
ln -s ../../images/flower2.jpg my_pictures/flower2.jpg
ln -s ../../images/flower3.jpg my_pictures/flower3.jpg
ln -s ../../images/flower4.jpg my_pictures/flower4.jpg

## first, generate an input file for dvd-slideshow using dir2slideshow:
echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dir2slideshow -n 'Complete example' -s filename -t 5 -c 1 -a '../audio/strojovna_07-TEXEMPO-30s.ogg' $* my_pictures"
echo " "
dir2slideshow -n 'Complete example' -t 5 -s filename -c 1 -a '../audio/strojovna_07-TEXEMPO-30s.ogg' $* my_pictures

if [ ! -f "Complete example.txt" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dir2slideshow!"
        echo "[runtest.sh]      This means something major failed in dir2slideshow"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

#############################################
echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-slideshow -n 'test complete' -f 'Complete example.txt' $*"
echo " "
dvd-slideshow -n 'test complete' -f 'Complete example.txt' $*

if [ ! -f "test complete.xml" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-slideshow!"
        echo "[runtest.sh]      This means something major failed in dvd-slideshow"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

rm -rf my_pictures

#################################################3
echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-menu -t 'My example' -t 'Slideshow 2' -f 'test_complete.xml' -f 'test complete.xml' -n 'Complete Example DVD' $*"
dvd-menu -t 'My example' -t 'Slideshow 2' -f 'test complete.xml' -f 'test complete.xml' -n 'Complete Example DVD' $*

if [ ! -f "vmgm.xml" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-menu!"
        echo "[runtest.sh]      This means something major failed in dvd-menu"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

# copy the pictures onto the dvd filesystem.  This works great for archiving!  AND, the dvd still plays
# fine in your player since the hardware ignores the directory.
#cp -r my_pictures "dvd_fs"

#xine -g -u 0 dvd:"`pwd`/dvd_fs/"  &

