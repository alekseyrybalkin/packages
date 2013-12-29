#!/bin/sh

pkgname=sysklogd
pkgver=1.5
urls="http://www.infodrom.org/projects/sysklogd/download/sysklogd-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make
}

kiin_install() {
  mkdir -pv ${pkgdir}/{usr/bin,usr/sbin}
  mkdir -pv ${pkgdir}/usr/share/man/man5
  mkdir -pv ${pkgdir}/usr/share/man/man8
  make prefix=${pkgdir} install
  mv -v ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin
  rmdir ${pkgdir}/usr/sbin
}
