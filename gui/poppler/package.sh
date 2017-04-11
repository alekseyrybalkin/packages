#!/bin/sh

pkgname=poppler
pkgver=0.53
ARCH_VERSION=${pkgver}.0
vcs=git
gittag=poppler-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr \
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
