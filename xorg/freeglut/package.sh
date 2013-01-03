#!/bin/sh

pkgname=freeglut
pkgver=2.8.0
urls="http://downloads.sourceforge.net/freeglut/freeglut-${pkgver}.tar.gz \
  http://www.linuxfromscratch.org/patches/blfs/svn/freeglut-${pkgver}-remove_smooth_opengl3_demo-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../freeglut-${pkgver}-remove_smooth_opengl3_demo-1.patch
  ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
