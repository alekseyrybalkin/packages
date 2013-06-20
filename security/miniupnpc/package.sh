#!/bin/sh

pkgname=miniupnpc
pkgver=1.8
urls="http://miniupnp.free.fr/files/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make
}

kiin_install() {
  make PREFIX=${pkgdir} install
  install -Dm644 man3/miniupnpc.3 ${pkgdir}/usr/share/man/man3/miniupnpc.3
}
