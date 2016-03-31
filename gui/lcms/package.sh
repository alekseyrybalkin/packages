#!/bin/sh

pkgname=lcms
ARCH_NAME=lcms2
ARCH_NAME_LIB32=lcms2
pkgver=2.7
vcs=git
gittag=lcms2-${pkgver}
urls="http://downloads.sourceforge.net/lcms/lcms2-${pkgver}.tar.gz"
srctar=lcms2-${pkgver}.tar.gz
srcdir=${location}/lcms2-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr --disable-static --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
