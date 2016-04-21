#!/bin/sh

pkgname=miniupnpc
pkgver=2.0
vcs=git
git_pkgname=miniupnp
gittag=miniupnpc_${pkgver//\./_}
urls="http://miniupnp.free.fr/files/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  cd miniupnpc
  make
}

kiin_install() {
  cd miniupnpc
  make PREFIX=${pkgdir} install
  install -Dm644 man3/miniupnpc.3 ${pkgdir}/usr/share/man/man3/miniupnpc.3
}
