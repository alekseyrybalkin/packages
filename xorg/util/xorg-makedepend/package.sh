#!/bin/sh

pkgname=xorg-makedepend
SKIP_ARCH_CHECK=1
pkgver=1.0.5
urls="http://xorg.freedesktop.org/releases/individual/util/makedepend-${pkgver}.tar.bz2"
srctar=makedepend-${pkgver}.tar.bz2
srcdir=${location}/makedepend-${pkgver}

kiin_make() {
  ./configure $XORG_CONFIG
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
