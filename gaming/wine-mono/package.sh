#!/bin/sh

pkgname=wine-mono
pkgver=4.5.2
urls="http://downloads.sourceforge.net/project/wine/Wine%20Mono/${pkgver}/$pkgname-${pkgver}.msi"

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  _monodir="${pkgdir}/usr/share/wine/mono"

  install -Dm644 ${KIIN_HOME}/tarballs/$pkgname-${pkgver}.msi $_monodir/$pkgname-${pkgver}.msi
}
