#!/bin/sh

pkgname=gimp
pkgver=2.8.10
urls="http://artfiles.org/gimp.org/gimp/v2.8/gimp-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/gimp-${pkgver}-freetype-1.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/gimp-${pkgver}-freetype-1.patch
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --without-gvfs
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
