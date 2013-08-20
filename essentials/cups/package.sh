#!/bin/sh

pkgname=cups
pkgver=1.6.3
urls="http://www.cups.org/software/${pkgver}/cups-${pkgver}-source.tar.bz2"
srctar=cups-${pkgver}-source.tar.bz2
srcdir=${location}/cups-${pkgver}

kiin_make() {
  ./configure --with-rcdir=/tmp/cupsinit \
    --with-docdir=/usr/share/cups/doc \
    --with-system-groups=lpadmin \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make BUILDROOT=${pkgdir} install-headers install-libs
}
