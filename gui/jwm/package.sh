#!/bin/sh

pkgname=jwm
pkgver=2.2.2
urls="http://joewing.net/projects/jwm/releases/jwm-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --sysconfdir=/etc --disable-fribidi
  make
}

kiin_install() {
  make BINDIR=${pkgdir}/usr/bin MANDIR=${pkgdir}/usr/share/man \
    SYSCONF=${pkgdir}/etc install
}
