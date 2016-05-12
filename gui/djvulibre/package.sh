#!/bin/sh

pkgname=djvulibre
pkgver=3.5.27.1
vcs=git
gittag=release.${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr --disable-desktopfiles
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
