#!/bin/sh

pkgname=pkg-config
pkgver=0.28
vcs=git
gittag=pkg-config-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh --prefix=/usr \
    --with-internal-glib \
    --docdir=/usr/share/doc/${pkgname} \
    --disable-host-tool
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
