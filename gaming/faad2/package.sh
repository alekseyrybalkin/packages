#!/bin/sh

pkgname=faad2
pkgver=2.7
urls="http://downloads.sourceforge.net/sourceforge/faac/${pkgname}-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/faad2-2.7-mp4ff-1.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/faad2-2.7-mp4ff-1.patch
  sed -i "s:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:g" configure.in
  sed -i "s:man_MANS:man1_MANS:g" frontend/Makefile.am
  autoreconf -fi
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
