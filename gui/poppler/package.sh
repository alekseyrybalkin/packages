#!/bin/sh

pkgname=poppler
pkgver=0.59
ARCH_VERSION=${pkgver}.0
vcs=git
gittag=poppler-${pkgver}
# extra zeroes in versions
#relmon_id=3686

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
