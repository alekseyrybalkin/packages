#!/bin/sh

pkgname=mercurial
pkgver=2.3.2
urls="http://mercurial.selenic.com/release/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  make build
}

kiin_install() {
  make PREFIX=${pkgdir}/usr install-bin
}
