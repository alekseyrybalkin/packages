#!/bin/sh

pkgname=fossil
pkgver=2.5
vcs=fossil
fossiltag=version-${pkgver}
urls="https://www.fossil-scm.org/download/fossil-src-${pkgver}.tar.gz"
srctar=fossil-src-${pkgver}.tar.gz
relmon_id=13971

undead_make() {
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
