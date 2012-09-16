#!/bin/sh

pkgname=sysvinit
pkgver=2.88dsf
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's@Sending processes@& configured via /etc/inittab@g' src/init.c
  sed -i -e 's/utmpdump wall/utmpdump/' \
        -e '/= mountpoint/d' \
        -e 's/mountpoint.1 wall.1//' src/Makefile
  make -C src
}

kiin_install() {
  make ROOT=${pkgdir} -C src install
}
