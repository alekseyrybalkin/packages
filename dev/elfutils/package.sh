#!/bin/sh

pkgname=elfutils
vcs=git
gittag=elfutils-0.159
pkgver=0.159
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  autoreconf -fi
  ./configure --prefix=/usr \
    --program-prefix="eu-" \
    --enable-maintainer-mode
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
