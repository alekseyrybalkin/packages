#!/bin/sh

pkgname=libcups
pkgver=1.6.1
urls="http://ftp.easysw.com/pub/cups/${pkgver}/cups-${pkgver}-source.tar.bz2"
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
