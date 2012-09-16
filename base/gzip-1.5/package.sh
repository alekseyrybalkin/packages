#!/bin/sh

pkgname=gzip
pkgver=1.5
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make prefix=${pkgdir}/usr install
  #mkdir -pv ${pkgdir}/usr/bin
  #mv -v ${pkgdir}/bin/{gzexe,uncompress,zcmp,zdiff,zegrep} /usr/bin
  #mv -v /bin/{zfgrep,zforce,zgrep,zless,zmore,znew} /usr/bin
}
