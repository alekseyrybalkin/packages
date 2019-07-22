#!/bin/sh

pkgname=fossil
pkgver=2.8
vcs=fossil
fossiltag=version-${pkgver}
# lists 2.9 before release
#relmon_id=13971

kiin_make() {
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
