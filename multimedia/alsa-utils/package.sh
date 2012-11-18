#!/bin/sh

pkgname=alsa-utils
pkgver=1.0.26
urls="http://gentoo.nixsolutions.com/distfiles/alsa-utils-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/alsa-utils-${pkgver}-no_xmlto-1.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../alsa-utils-${pkgver}-no_xmlto-1.patch
  ./configure --without-systemdsystemunitdir
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # remove /var, filesystem package creates everything in there
  rm -rvf ${pkgdir}/var
}
