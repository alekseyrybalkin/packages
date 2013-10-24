#!/bin/sh

pkgname=sysvinit
pkgver=2.88dsf
urls="http://download.savannah.gnu.org/releases/sysvinit/sysvinit-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's@Sending processes@& configured via /etc/inittab@g' src/init.c
  sed -i -e '/= utmpdump wall/d' \
        -e '/= mountpoint/d' \
        -e '/= utmpdump.1 mountpoint.1 wall.1/d' src/Makefile
  make -C src
}

kiin_install() {
  make ROOT=${pkgdir} -C src install
  # mesg, last and lastb are supplied by util-linux since 2.24
  rm ${pkgdir}/usr/bin/{mesg,lastb,last}
  rm ${pkgdir}/usr/share/man/man1/{mesg,lastb,last}.1
}
