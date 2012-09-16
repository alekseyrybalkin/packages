#!/bin/sh

pkgname=psmisc
pkgver=22.19
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/bin
  mv -v ${pkgdir}/usr/bin/fuser   ${pkgdir}/bin
  mv -v ${pkgdir}/usr/bin/killall ${pkgdir}/bin
}
