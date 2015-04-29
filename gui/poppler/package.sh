#!/bin/sh

pkgname=poppler
vcs="git"
pkgver=0.32.0
gittag=poppler-${pkgver}
srcdir=${location}/poppler-${pkgver}

kiin_make() {
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-zlib \
    --disable-static \
    --enable-xpdf-headers \
    --disable-poppler-qt4
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
