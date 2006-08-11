%define name	dvd-slideshow
%define version	0.7.5
%define release 1
%define dvd_slideshow %{name}-%{version}

Name: 	 	%{name}
Summary: 	Creates a DVD slideshow with menus and effects from a list of images.
Version: 	%{version}
Release: 	%{release}

Source:		%{name}-%{version}.tar.gz
URL:		http://dvd-slideshow.sourceforge.net
License:	GPL
Group:		Applications/Multimedia
BuildRoot:	%{_tmppath}/%{name}-buildroot
Requires:	mjpegtools ImageMagick sox urw-fonts
Requires:	ffmpeg >= 0.4.8
Requires:	dvdauthor >= 0.6.10
BuildArch:	noarch

%description
DVD-slideshow makes a DVD slideshow video with menus from a batch of pictures.
It consists of a set of scripts:
* dvd-slideshow reads a text file list of all the pictures you want in one
  slideshow and creates a DVD-compatible MPEG movie with your audio track and
  specified timing.
* dvd-menu makes a top-level DVD menu with the output files from
  dvd-slideshow or your own movies.
* dir2slideshow makes the input file for dvd-slideshow from a directory
  of pictures.
* gallery1-to-slideshow makes the input file for dvd-slideshow from your Gallery
  v1.x album.
* jigl2slideshow makes the input file for dvd-slideshow from your jigl album.

NOTE:  You'll need an ogg or mp2 or mp3 decoder if you wish to add audio.

%prep
%setup -q -n %{name}-%{version}

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%_bindir
mkdir -p $RPM_BUILD_ROOT/usr/man/man1
install -m 0755 dvd-slideshow $RPM_BUILD_ROOT/%_bindir/
install -m 0755 dvd-menu $RPM_BUILD_ROOT/%_bindir/
install -m 0755 dvd-iso $RPM_BUILD_ROOT/%_bindir/
install -m 0755 dir2slideshow $RPM_BUILD_ROOT/%_bindir/
install -m 0755 gallery1-to-slideshow $RPM_BUILD_ROOT/%_bindir/
install -m 0755 jigl2slideshow $RPM_BUILD_ROOT/%_bindir/
install -m 0644 man/dvd-slideshow.1 $RPM_BUILD_ROOT/usr/man/man1/
install -m 0644 man/dvd-menu.1 $RPM_BUILD_ROOT/usr/man/man1/
install -m 0644 man/dir2slideshow.1 $RPM_BUILD_ROOT/usr/man/man1/
install -m 0644 man/gallery1-to-slideshow.1 $RPM_BUILD_ROOT/usr/man/man1/
install -m 0644 man/jigl2slideshow.1 $RPM_BUILD_ROOT/usr/man/man1/

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%doc doc/ TODO.txt INSTALL.txt COPYING.txt
%{_bindir}/*
/usr/man/man1/dvd-slideshow.1.gz
/usr/man/man1/dvd-menu.1.gz
/usr/man/man1/dir2slideshow.1.gz
/usr/man/man1/gallery1-to-slideshow.1.gz
/usr/man/man1/jigl2slideshow.1.gz

%changelog
* Thu Mar 9 2006 Scott Dylewski <scott at dylewski.com> 0.7.5-1
- 0.7.5 released (bug fixes for ImageMagick > 6.2.4)
- noarch

* Fri Jan 27 2006 Scott Dylewski <scott at dylewski.com> 0.7.4-1
- 0.7.4 released (major bug fixes for bash 3.1)
- noarch

* Tue Nov 22 2005 Scott Dylewski <scott at dylewski.com> 0.7.2-1
- 0.7.2 released (major bug fixes for new version of mjpegtools)
- noarch

* Tue Mar 1 2005 Scott Dylewski <scott at dylewski.com> 0.7.1-1
- 0.7.1 released (small bug fixes and documentation upgrades)
- noarch

* Fri Feb 18 2005 Scott Dylewski <scott at dylewski.com> 0.7.0-1
- 0.7.0 released
- noarch

* Fri Apr 23 2004 Scott Dylewski <scott at dylewski.com> 0.6.0-1
- 0.6.0 released
- noarch

* Sun Feb 29 2004 Scott Dylewski <scott at dylewski.com> 0.5.4-1
- 0.5.4 released
- noarch

* Wed Jan 14 2004 Austin Acton <austin@mandrake.org> 0.4.8-1mdk
- 0.4.8
- noarch

* Thu Jan 8 2004 Austin Acton <austin@linux.ca> 0.4.6-1mdk
- initial package
