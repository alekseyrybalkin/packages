#!/bin/sh

pkgname=miniupnpc
pkgver=1.9+
vcs=git
git_pkgname=miniupnp
gittag=dc9eb0df1c8ee36101b7c269a4695d247d0a48cc
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
