#!/bin/sh

pkgname=sdl2_ttf
pkgver=2.0.15
vcs=mercurial
hgtag=release-${pkgver}
relmon_id=4784

build() {
    touch NEWS README AUTHORS ChangeLog
    autoreconf -vi
    ./configure --disable-static --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
