#!/bin/sh

pkgname=djvulibre
pkgver=3.5.27.1
vcs=git
gittag=release.${pkgver}
relmon_id=10159

undead_make() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr --disable-desktopfiles
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
