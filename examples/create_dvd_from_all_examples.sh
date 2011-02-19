#!/bin/bash

if [ ! -d dvd_fs ] ; then
        mkdir dvd_fs
else
        rm -rf dvd_fs/*
fi

if [ ! -e 'very_simple/verysimple.vob' ] ; then
	cd very_simple
	nice sh runtest.sh
	cd ..
fi
if [ ! -e 'simple/simple.vob' ] ; then
	cd simple
	nice sh runtest.sh
	cd ..
fi
if [ ! -e 'audio/audio.vob' ] ; then
	cd audio
	nice sh runtest.sh
	cd ..
fi
if [ ! -e 'complex/complex.vob' ] ; then
	cd complex
	nice sh runtest.sh
	cd ..
fi
if [ ! -e 'complete/complete.vob' ] ; then
	cd complete
	nice sh runtest.sh
fi
if [ ! -e '0.7.5/0.7.5.vob' ] ; then
	cd '0.7.5'
	nice sh runtest.sh
	cd ..
fi
if [ ! -e '0.8.0/0.8.0.vob' ] ; then
	cd '0.8.0'
	nice sh runtest.sh
	cd ..
fi

dvd-menu -t 'Very Simple' -t 'Simple' -t 'Audio' -t 'Complex' -t 'Complete' -t '0.7.5' -t '0.8.0' -f very_simple/verysimple.xml -f simple/simple.xml -f audio/audio.xml -f complex/complex.xml -f 'complete/test complete.xml' -f '0.7.5/my_slideshow.xml' -f '0.8.0/my_slideshow.xml' -n 'Example DVD' -iso

#xine dvd:"`pwd`/dvd_fs/"  &

