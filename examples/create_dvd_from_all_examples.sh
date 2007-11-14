#!/bin/bash

if [ ! -d dvd_fs ] ; then
        mkdir dvd_fs
else
        rm -rf dvd_fs/*
fi

dvd-menu -t 'Very Simple' -t 'Simple' -t 'Audio' -t 'Complex' -t 'Complete' -t '0.7.5' -t '0.8.0' -f very_simple/verysimple.xml -f simple/simple.xml -f audio/audio.xml -f complex/complex.xml -f 'complete/test_complete.xml' -f '0.7.5/my_slideshow.xml' -f '0.8.0/my_slideshow.xml' -n 'Example DVD' -iso

#xine dvd:"`pwd`/dvd_fs/"  &

