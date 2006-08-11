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
check_rm test_complete.xml
check_rm test_complete.vob
check_rm dvd-slideshow.log
check_rm dvd-menu.log
check_rm vmgm.xml
check_rm menu.vob
check_rm menu.xml
rm -rf dvd_fs_complete  # from the older examples

## first, generate an input file for dvd-slideshow using dir2slideshow:
echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dir2slideshow -n 'Complete example' -t 5 -c 1 -a 'strojovna_07-TEXEMPO-30s.ogg' $* my_pictures"
echo " "
dir2slideshow -n 'Complete example' -t 5 -c 1 $* my_pictures

if [ ! -f "Complete_example.txt" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dir2slideshow!"
        echo "[runtest.sh]      This means something major failed in dir2slideshow"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

#############################################
echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-slideshow -n 'test complete' -f Complete_example.txt $*"
echo " "
dvd-slideshow -n 'test complete' -f Complete_example.txt -a 'strojovna_07-TEXEMPO-30s.ogg' $*

if [ ! -f "test_complete.xml" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-slideshow!"
        echo "[runtest.sh]      This means something major failed in dvd-slideshow"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

#################################################3
echo "[runtest.sh] Executing command:"
echo "[runtest.sh] dvd-menu -t 'My example' -t 'Slideshow 2' -f test_complete.xml -f test_complete.xml -n 'Complete Example DVD' $*"
dvd-menu -t 'My example' -t 'Slideshow 2' -f test_complete.xml -f test_complete.xml -n 'Complete Example DVD' $*

if [ ! -f "vmgm.xml" ] ; then
        echo "[runtest.sh] ERROR: No output files found from dvd-menu!"
        echo "[runtest.sh]      This means something major failed in dvd-menu"
        echo "[runtest.sh]      You need to fix this before proceeding with the example"
        exit 0
fi

# copy the pictures onto the dvd filesystem.  This works great for archiving!  AND, the dvd still plays
# fine in your player since the hardware ignores the directory.
cp -a my_pictures "dvd_fs"

#xine -g -u 0 dvd:"`pwd`/dvd_fs/"  &

