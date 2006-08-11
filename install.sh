#!/bin/bash

## install some files and such:

# copy documentation:
cp man/dvd-slideshow.1 /usr/local/man/man1/.
cp man/dvd-menu.1 /usr/local/man/man1/.
cp man/dir2slideshow.1 /usr/local/man/man1/.
cp man/gallery1-to-slideshow.1 /usr/local/man/man1/.
cp man/jigl2slideshow.1 /usr/local/man/man1/.

# copy executables:
cp dvd-slideshow /usr/bin/.
cp dvd-menu /usr/bin/.
cp gallery1-to-slideshow /usr/bin/.
cp jigl2slideshow /usr/bin/.
cp dir2slideshow /usr/bin/.

remove old versions:
if [ -r "/usr/bin/gallery2slideshow" ] ; then
	echo "Removing old gallery2slideshow and installing gallery1-to-slideshow instead"
	echo "See changelog for details."
	rm "/usr/bin/gallery2slideshow"
	rm "/usr/local/man/man1/gallery2slideshow.1"
fi
